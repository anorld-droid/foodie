import 'package:common/common.dart';
import 'package:delivery/src/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 13.04.2023.
class DeliveryMap extends GetView<DeliveryController> {
  const DeliveryMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.colorScheme.onSurface,
      body: Obx(
        () => controller.currentLocation.value == null
            ? Center(
                child: Material(
                  color: Get.theme.colorScheme.primaryContainer,
                  surfaceTintColor: Get.theme.colorScheme.primaryContainer,
                  child: Container(
                    color: Get.theme.colorScheme.primaryContainer,
                    padding: const EdgeInsets.all(4.0),
                    child: RotationTransition(
                      turns: Tween(begin: 0.0, end: 1.0)
                          .animate(controller.animationController),
                      child: GradientCircularProgressIndicator(
                        radius: 20,
                        gradientColors: [
                          Get.theme.colorScheme.primary.withAlpha(100),
                          Get.theme.colorScheme.primary,
                        ],
                        strokeWidth: 5.0,
                      ),
                    ),
                  ),
                ),
              )
            : GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(controller.currentLocation.value!.latitude!,
                      controller.currentLocation.value!.longitude!),
                  zoom: 12.5,
                ),
                mapToolbarEnabled: false,
                markers: {
                  Marker(
                    markerId: const MarkerId('currentLocation'),
                    icon: controller.currentLocationIcon.value,
                    position: LatLng(
                      controller.currentLocation.value!.latitude!,
                      controller.currentLocation.value!.longitude!,
                    ),
                    infoWindow: const InfoWindow(title: 'Courier Location'),
                  ),
                  Marker(
                      markerId: const MarkerId('destination'),
                      icon: controller.destinationIcon.value,
                      position: controller.destination,
                      infoWindow: const InfoWindow(title: 'Destination')),
                },
                onMapCreated: (mapController) {
                  controller.mapController.complete(mapController);
                  controller.setMapBounds(
                      controller.currentLocation.value!.latitude!,
                      controller.currentLocation.value!.longitude!);
                },
                polylines: {
                  Polyline(
                      polylineId: const PolylineId('route'),
                      points: controller.polylineCoordinates.value,
                      width: 4,
                      startCap: Cap.roundCap,
                      endCap: Cap.roundCap),
                },
              ),
      ),
    );
  }
}
