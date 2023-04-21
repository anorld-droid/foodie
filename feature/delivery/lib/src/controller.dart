import 'dart:async';
import 'package:common/common.dart';
import 'package:delivery/delivery.dart';
import 'package:delivery/src/strings.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:model/model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 13.04.2023.
class DeliveryController extends GetxController
    with GetTickerProviderStateMixin {
  final ShippingModel model;
  DeliveryController({required this.model});

  late final ShippingUseCase _shippingUseCase;
  late final AuthenticateUser _authenticateUser;
  late final DeliveryUseCase _deliveryUseCase;

  // Google map coordinate variables declaration
  late Completer<GoogleMapController> mapController;
  Rx<LocationData?> currentLocation = Rx(null);
  // late final LatLng sourceLocation;
  late final LatLng destination;
  //Google maps marker icons
  Rx<BitmapDescriptor> destinationIcon = Rx(BitmapDescriptor.defaultMarker);
  Rx<BitmapDescriptor> currentLocationIcon = Rx(BitmapDescriptor.defaultMarker);

  final Rx<List<LatLng>> polylineCoordinates = Rx([]);

  late Rx<String> status;
  final Rx<String> time = Rx('');

  final Rx<Courier?> courier = Rx(null);

  //Progressbar controller
  late AnimationController animationController;

  @override
  void onInit() async {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    initVars();
    await loadData();
    setCustomMarkerIcon();
    super.onInit();
  }

  void initVars() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      // Status bar color
      statusBarColor: Get.theme.colorScheme.primaryContainer,
      // Status bar brightness (optional)
      statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
    ));

    _shippingUseCase = ShippingUseCase();
    _authenticateUser = AuthenticateUser();
    _deliveryUseCase = DeliveryUseCase();

    //Google maps variables initializing
    mapController = Completer();
    status = Rx(model.status);
  }

  Future<void> loadData() async {
    animationController.repeat();
    var snap = await _shippingUseCase.getDocs(
        _authenticateUser.getUserId()!, model.id!);
    snap.listen((event) async {
      destination = LatLng(
        event.data()!.user.lat,
        event.data()!.user.lng,
      );
      status.value = event.data()!.status;
      courier.value = event.data()!.courier;
      await courierLocation(event.data()!.status == 'Delivered');
    });
  }

  Future<void> courierLocation(bool status) async {
    if (courier.value != null) {
      var courierSnap = await _deliveryUseCase.get(courier.value!.uid);
      courierSnap.listen((event) async {
        Delivery? delivery = event.data();
        if (delivery != null) {
          var latLong = LatLng(delivery.lat, delivery.lng);
          final dist = await calculateDeliveryTime(
            sourceLocation: destination,
            deliveryAddress: latLong,
            histoData: delivery.historicalData,
            preparationTime: delivery.preparationTime,
            speed: delivery.speed,
          );
          getPolyPoints(delivery.lat, delivery.lng);
          getCurrentLocation(delivery.lat, delivery.lng);
          updateHistoricalData(delivery: delivery, distance: dist);
        }
      });
    }
  }

  ///Decodes encoded google polyline string into list of geo-coordinates suitable for showing route/polyline on maps.
  void getPolyPoints(double lat, double long) async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      Strings.mapsKey,
      PointLatLng(lat, long),
      PointLatLng(destination.latitude, destination.longitude),
    );
    if (result.points.isNotEmpty) {
      polylineCoordinates.value.clear();
      for (var point in result.points) {
        polylineCoordinates.value.add(
          LatLng(point.latitude, point.longitude),
        );
      }
      polylineCoordinates.refresh();
    }
  }

  /// Streams courier current location from firebase.
  void getCurrentLocation(double lat, double lng) async {
    //Pseudo-code:
    // Get the stream from firestore
    // Listen to changes
    // Update current location with the values
    // Animate the camera to the new location
    // Get polypoints from the new location
    currentLocation.value = LocationData.fromMap({
      'latitude': lat,
      'longitude': lng,
    });
    setMapBounds(lat, lng);
  }

  void setMapBounds(double lat, double lng) async {
    LatLng startPoint = LatLng(lat, lng);
    LatLng endPoint = destination;
    double southLat = startPoint.latitude < endPoint.latitude
        ? startPoint.latitude
        : endPoint.latitude;
    double westLng = startPoint.longitude < endPoint.longitude
        ? startPoint.longitude
        : endPoint.longitude;
    double northLat = startPoint.latitude > endPoint.latitude
        ? startPoint.latitude
        : endPoint.latitude;
    double eastLng = startPoint.longitude > endPoint.longitude
        ? startPoint.longitude
        : endPoint.longitude;
    LatLngBounds bounds = LatLngBounds(
      southwest: LatLng(southLat, westLng),
      northeast: LatLng(northLat, eastLng),
    );
    GoogleMapController googleMapController = await mapController.future;
    googleMapController
        .animateCamera(CameraUpdate.newLatLngBounds(bounds, 50.0));
    animationController.reset();
  }

  void setCustomMarkerIcon() async {
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration.empty, 'assets/destination.png',
            package: 'delivery')
        .then(
      (icon) {
        destinationIcon.value = icon;
      },
    );
  }

  String statusTag(String status, String id) {
    switch (status) {
      case 'Received':
        return 'Order ${id.substring(0, 4)}... has been received';
      case 'Ready':
        return 'Your order has been processed and is ready for shipping';
      case 'Shipping':
        return 'Your order is already on its way to you';
      default:
        return 'Order  ${id.substring(0, 4)}... delivered';
    }
  }

  void call() async {
    final number = 'tel:${courier.value?.phoneNumber}';
    Uri uri = Uri.parse(number);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $number';
    }
  }

// This function calculates the estimated delivery time based on the distance
// between the courier and the delivery address.
  Future<double> calculateDeliveryTime({
    required LatLng sourceLocation,
    required LatLng deliveryAddress,
    required double speed,
    required int preparationTime,
    required Map<double, List<double>> histoData,
  }) async {
    // preparationTime -->  Time in minutes it takes the restaurant to prepare the food
    // historicalData --> List of previous delivery times to the same location
    final currentDateTime = DateTime.now(); // Current date and time
    // Calculate the distance between the two locations using the Google Maps Distance Matrix API

    final distanceMatrix = await DistanceMatrix().distanceWithLocation(
      startLatitude: sourceLocation.latitude,
      startLongitude: sourceLocation.longitude,
      endLatitude: deliveryAddress.latitude,
      endLongitude: deliveryAddress.longitude,
    );
    final List<double> historicalData = histoData[distanceMatrix] ?? [];
    // Calculate travel time in minutes
    final travelTime = distanceMatrix.toInt() / speed;
    print(travelTime);
    final deliveryTime = currentDateTime
        .add(Duration(minutes: preparationTime + travelTime.toInt()));
    final estimatedDeliveryTime = deliveryTime.add(
      Duration(
          minutes: historicalData.isEmpty
              ? 0
              : historicalData.reduce((a, b) => a + b) ~/
                  historicalData.length),
    ); // Calculate average historical delivery time
    final formatter = DateFormat('h:mm a');
    final formattedDeliveryTime = formatter.format(estimatedDeliveryTime);
    // Display the estimated delivery time
    time.value = formattedDeliveryTime.toString();
    return distanceMatrix;
  }

  Future<void> updateHistoricalData({
    required Delivery delivery,
    required double distance,
  }) async {
    final hist = delivery.historicalData;
    final value = hist[distance] ?? [];
    DateTime now = DateTime.now();
    double duration = now.difference(model.timeStamp).inMilliseconds / 1000.0;
    value.add((duration));
    hist[distance] = value;
    if (status.value == 'Delivered') {
      _deliveryUseCase.updateHistoricalData(
          courierId: courier.value!.uid, historicalData: hist);
    }
  }

  void back() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      // Status bar color
      statusBarColor: Get.theme.colorScheme.primaryContainer,
      // Status bar brightness (optional)
      statusBarIconBrightness: Get.theme.brightness, // For Android (dark icons)
    ));
    Get.back<void>();
  }
}
