import 'dart:async';
import 'package:delivery/src/strings.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:model/model.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 13.04.2023.
class DeliveryController extends GetxController {
  final ShippingModel model;
  DeliveryController({required this.model});

  late final ShippingUseCase _shippingUseCase;
  late final AuthenticateUser _authenticateUser;
  late final DeliveryUseCase _deliveryUseCase;

  // Google map coordinate variables declaration
  late Completer<GoogleMapController> mapController;
  Rx<LocationData?> currentLocation = Rx(null);
  late final LatLng sourceLocation;
  late final LatLng destination;
  //Google maps marker icons
  Rx<BitmapDescriptor> destinationIcon = Rx(BitmapDescriptor.defaultMarker);
  Rx<BitmapDescriptor> currentLocationIcon = Rx(BitmapDescriptor.defaultMarker);

  final Rx<List<LatLng>> polylineCoordinates = Rx([]);

  late Rx<String> status;
  final Rx<String> time = Rx('');

  final Rx<Courier?> courier = Rx(null);

  @override
  void onInit() async {
    super.onInit();
    initVars();
    await loadData();
    setCustomMarkerIcon();
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
    destination = const LatLng(-0.057822991209217858, 34.6032983890644);

    status = Rx(model.status);
  }

  Future<void> loadData() async {
    var snap = await _shippingUseCase.getDocs(
        _authenticateUser.getUserId()!, model.id!);
    snap.listen((event) async {
      time.value = event.data()!.timeEstimate ?? '';
      status.value = event.data()!.status;
      courier.value = event.data()!.courier;
      print('ID --> ${courier.value!.uid}');

      await courierLocation();
    });
  }

  Future<void> courierLocation() async {
    if (courier.value != null) {
      var courierSnap = await _deliveryUseCase.get(courier.value!.uid);
      courierSnap.listen((event) {
        Delivery? delivery = event.data();
        if (delivery != null) {
          // print(delivery.lat);
          getPolyPoints(delivery.lat, delivery.long);
          getCurrentLocation(delivery.lat, delivery.long);
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
  void getCurrentLocation(double lat, double long) async {
    //Pseudo-code:
    // Get the stream from firestore
    // Listen to changes
    // Update current location with the values
    // Animate the camera to the new location
    // Get polypoints from the new location
    currentLocation.value = LocationData.fromMap({
      'latitude': lat,
      'longitude': long,
    });
    GoogleMapController googleMapController = await mapController.future;
    googleMapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          zoom: 12.5,
          target: LatLng(
            lat,
            long,
          ),
        ),
      ),
    );
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

  String statusTag(String status) {
    switch (status) {
      case 'Received':
        return 'Order ${model.id!.substring(0, 4)}... has been received';
      case 'Ready':
        return 'Your order has been processed and is ready for shipping';
      case 'Shipping':
        return 'Your order is already on its way to you';
      default:
        return 'Order  ${model.id!.substring(0, 4)}... delivered';
    }
  }

  void call(String number) {}
}
