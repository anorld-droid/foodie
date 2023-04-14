import 'dart:async';

import 'package:delivery/src/strings.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:model/model.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 13.04.2023.
class Controller extends GetxController {
  // Google map coordinate variables declaration
  late final Completer<GoogleMapController> mapController;
  Rx<LocationData?> currentLocation = Rx(null);
  late final LatLng sourceLocation;
  late final LatLng destination;
  //Google maps marker icons
  late BitmapDescriptor sourceIcon;
  late BitmapDescriptor destinationIcon;
  late BitmapDescriptor currentLocationIcon;

  final Rx<List<LatLng>> polylineCoordinates = Rx([]);
  late GoogleMapController googleMapController;

  //Shipping information
  late final ShippingUseCase _shippingUseCase;
  late final AuthenticateUser _authenticateUser;
  final Rx<List<ShippingModel>> shippingModel = Rx([]);

  void initVars() {
    //Google maps variables initializing
    mapController = Completer();
    sourceLocation = const LatLng(-0.005273248425477859, 34.59785159831812);
    destination = const LatLng(-0.017822991209217858, 34.6032983890644);
    sourceIcon = BitmapDescriptor.defaultMarker;
    destinationIcon = BitmapDescriptor.defaultMarker;
    currentLocationIcon = BitmapDescriptor.defaultMarker;
  }

  void initUsecase() {
    _shippingUseCase = ShippingUseCase();
    _authenticateUser = AuthenticateUser();
  }

  Future<void> loadData() async {
    var snap = await _shippingUseCase.get(_authenticateUser.getUserId()!);
    snap.listen((event) {
      shippingModel.value.clear();
      for (var doc in event.docs) {
        shippingModel.value.add(doc.data());
      }
      shippingModel.refresh();
    });
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
    }
  }

  /// Streams courier current location from firebase.
  void getCurrentLocation() async {
    googleMapController = await mapController.future;
    //Pseudo-code:
    // Get the stream from firestore
    // Listen to changes
    // Update current location with the values
    // Animate the camera to the new location
    // Get polypoints from the new location
    // googleMapController.animateCamera(
    //   CameraUpdate.newCameraPosition(
    //     CameraPosition(
    //       zoom: 13.5,
    //       target: LatLng(
    //         latitude,
    //         longitude,
    //       ),
    //     ),
    //   ),
    // );
  }

  void setCustomMarkerIcon() {
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration.empty, "assets/current.png")
        .then(
      (icon) {
        sourceIcon = icon;
      },
    );
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration.empty, "assets/destination.png")
        .then(
      (icon) {
        destinationIcon = icon;
      },
    );
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration.empty, "assets/location_green.png")
        .then(
      (icon) {
        currentLocationIcon = icon;
      },
    );
  }
}
