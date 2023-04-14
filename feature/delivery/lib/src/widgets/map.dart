import 'package:common/common.dart';
import 'package:delivery/src/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 13.04.2023.
class DeliveryMap extends GetView<Controller> {
  const DeliveryMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.currentLocation.value == null
            ? Center(
                child: GradientCircularProgressIndicator(
                  radius: 40,
                  gradientColors: [
                    Get.theme.colorScheme.primary,
                    Get.theme.colorScheme.primary.withAlpha(100)
                  ],
                ),
              )
            : GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(controller.currentLocation.value!.latitude!,
                      controller.currentLocation.value!.longitude!),
                  zoom: 13.5,
                ),
                markers: {
                  Marker(
                    markerId: const MarkerId('currentLocation'),
                    icon: controller.currentLocationIcon,
                    position: LatLng(
                      controller.currentLocation.value!.latitude!,
                      controller.currentLocation.value!.longitude!,
                    ),
                    infoWindow: const InfoWindow(title: 'Courier Location'),
                  ),
                  Marker(
                      markerId: const MarkerId('destination'),
                      icon: controller.destinationIcon,
                      position: controller.destination,
                      infoWindow: const InfoWindow(title: 'My Location')),
                },
                onMapCreated: (mapController) {
                  controller.mapController.complete(mapController);
                },
                polylines: {
                  Polyline(
                    polylineId: const PolylineId('route'),
                    points: controller.polylineCoordinates.value,
                    color: Get.theme.colorScheme.primary,
                    width: 6,
                  ),
                },
              ),
      ),
    );
  }
}
