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
      body: Obx(
        () => controller.currentLocation.value == null
            ? Center(
                child: GradientCircularProgressIndicator(
                  radius: 20,
                  strokeWidth: 5.0,
                  gradientColors: [
                    Get.theme.colorScheme.primary,
                    Get.theme.colorScheme.primary.withAlpha(100)
                  ],
                ),
              )
            : Obx(
                () => GoogleMap(
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
      ),
    );
  }
}
