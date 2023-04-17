import 'dart:async';
import 'package:delivery/src/strings.dart';
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

  // Google map coordinate variables declaration
  late Completer<GoogleMapController> mapController;
  Rx<LocationData?> currentLocation = Rx(null);
  late final LatLng sourceLocation;
  late final LatLng destination;
  //Google maps marker icons
  Rx<BitmapDescriptor> destinationIcon = Rx(BitmapDescriptor.defaultMarker);
  Rx<BitmapDescriptor> currentLocationIcon = Rx(BitmapDescriptor.defaultMarker);

  final Rx<List<LatLng>> polylineCoordinates = Rx([]);

  final Rx<String> status = Rx('');
  final Rx<String> time = Rx(''); //TODO: Update from stream firestore

  @override
  void onInit() {
    super.onInit();
    initVars();
    getPolyPoints();
    getCurrentLocation();
    setCustomMarkerIcon();
  }

  void initVars() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      // Status bar color
      statusBarColor: Get.theme.colorScheme.primaryContainer,
      // Status bar brightness (optional)
      statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
    ));
    //Google maps variables initializing
    mapController = Completer();
    sourceLocation = const LatLng(-0.005273248425477859, 34.59785159831812);
    destination = const LatLng(-0.057822991209217858, 34.6032983890644);
  }

  ///Decodes encoded google polyline string into list of geo-coordinates suitable for showing route/polyline on maps.
  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      Strings.mapsKey,
      PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
      PointLatLng(destination.latitude, destination.longitude),
    );
    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.value.add(
          LatLng(point.latitude, point.longitude),
        );
      }
      polylineCoordinates.refresh();
    }
  }

  /// Streams courier current location from firebase.
  void getCurrentLocation() async {
    //Pseudo-code:
    // Get the stream from firestore
    // Listen to changes
    // Update current location with the values
    // Animate the camera to the new location
    // Get polypoints from the new location
    currentLocation.value = LocationData.fromMap({
      'latitude': sourceLocation.latitude,
      'longitude': sourceLocation.longitude,
    });
    GoogleMapController googleMapController = await mapController.future;
    // location.onLocationChanged.listen((value) {
    // currentLocation.value = value;
    googleMapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          zoom: 13.5,
          target: LatLng(
            currentLocation.value!.latitude!,
            currentLocation.value!.longitude!,
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

  String statusTag(String status, String orderNo) {
    switch (status) {
      case 'Received':
        return 'Order $orderNo has been received.';
      case 'Ready':
        return 'Your order has been processed and is ready for shipping';
      case 'Shippping':
        return 'Your order is already on its way to you.';
      default:
        return 'Order $orderNo delivered';
    }
  }

  void call(String number) {}
}
