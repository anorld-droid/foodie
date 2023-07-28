import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instore/src/controller.dart';
import 'package:instore/src/strings.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 29.04.2023.
class Body extends GetView<QRController> {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.87,
      decoration: BoxDecoration(
          color: Get.theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(16.0)),
      child: Column(
        children: <Widget>[
          Container(
            height: 4,
            width: Get.width * 0.2,
            margin: const EdgeInsets.symmetric(
              vertical: 16.0,
            ),
            decoration: BoxDecoration(
                color: Get.theme.colorScheme.background,
                borderRadius: BorderRadius.circular(30.0)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(
              Strings.header,
              style: Get.textTheme.bodyMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              Strings.message,
              style: Get.textTheme.bodyLarge,
            ),
          ),
          Expanded(
            flex: 4,
            child: _buildQrView(context),
          ),
          Obx(
            () => Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: Get.width * 0.80,
                  decoration: BoxDecoration(
                    color: Get.theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(6.0),
                  margin: const EdgeInsets.symmetric(vertical: 48.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () async {
                          await controller.qrviewController.value
                              ?.toggleFlash();
                          controller.isTorchOn.toggle();
                        },
                        child: Card(
                            elevation: 5,
                            color: Get.theme.colorScheme.primary.withGreen(201),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                controller.isTorchOn.value
                                    ? Icons.flash_on_outlined
                                    : Icons.flash_off_outlined,
                                color: Get.theme.colorScheme.onPrimary,
                              ),
                            )),
                      ),
                      InkWell(
                        onTap: () async {
                          controller.isPaused.value
                              ? await controller.qrviewController.value
                                  ?.resumeCamera()
                              : await controller.qrviewController.value
                                  ?.pauseCamera();
                          controller.isPaused.toggle();
                          if (!controller.isPaused.value) {
                            controller.result.value = null;
                          }
                        },
                        child: Card(
                            elevation: 5,
                            color: Get.theme.colorScheme.primary.withGreen(201),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                controller.isPaused.value
                                    ? Icons.play_arrow_outlined
                                    : Icons.pause,
                                color: Get.theme.colorScheme.onPrimary,
                              ),
                            )),
                      ),
                      InkWell(
                        onTap: () async {
                          await controller.qrviewController.value?.flipCamera();
                          controller.isPaused.value = false;
                          controller.result.value = null;
                        },
                        child: Card(
                            elevation: 5,
                            color: Get.theme.colorScheme.primary.withGreen(201),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.flip_camera_android_outlined,
                                color: Get.theme.colorScheme.onPrimary,
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (Get.width < 400 || Get.height < 400) ? 150.0 : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: scanArea,
              width: scanArea,
              child: QRView(
                key: controller.qrKey,
                onQRViewCreated: controller.onQRViewCreated,
                overlay: QrScannerOverlayShape(
                    borderColor: Get.theme.colorScheme.primary,
                    borderRadius: 12,
                    borderLength: 30,
                    borderWidth: 10,
                    cutOutSize: scanArea,
                    overlayColor: Get.theme.colorScheme.surface),
                onPermissionSet: (ctrl, p) =>
                    controller.onPermissionSet(context, ctrl, p),
              ),
            ),
            Container(
              height: scanArea + 2,
              width: scanArea + 2,
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 2, color: Get.theme.colorScheme.surface),
                  color: Get.theme.colorScheme.primaryContainer),
            )
          ],
        ),
        Obx(
          () => Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: controller.result.value == null
                ? Text(Strings.scanningCode, style: Get.textTheme.bodySmall)
                : Text(
                    controller.addedToCart.value
                        ? Strings.scanAnotherQrCode
                        : Strings.addingToCart,
                    style: Get.textTheme.bodySmall),
          ),
        ),
      ],
    );
  }
}
