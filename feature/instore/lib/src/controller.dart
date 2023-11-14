import 'package:common/common.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instore/src/strings.dart';
import 'package:model/model.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 30.04.2023.
class QRController extends GetxController {
  Rx<Barcode?> result = Rx(null);
  Rx<QRViewController?> qrviewController = Rx(null);
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  late final CartItemsUseCase _cartItemsUseCase;
  late final CuisineItemUseCase _cuisineItemUseCase;

  final RxBool isTorchOn = false.obs;
  final RxBool addedToCart = true.obs;
  final RxBool isPaused = false.obs;

  @override
  void onInit() {
    init();
    super.onInit();
  }

  void init() {
    _cartItemsUseCase = CartItemsUseCase();
    _cuisineItemUseCase = CuisineItemUseCase();
  }

  void onQRViewCreated(QRViewController controller) async {
    qrviewController.value = controller;
    controller.scannedDataStream.listen((scanData) async {
      result.value = scanData;
      if (scanData.code != null) {
        qrviewController.value?.pauseCamera();
        isPaused.value = true;
        await addToCart(scanData.code!);
      }
    });
  }

  void onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    if (!p) {
      shortToast('No Permission');
    }
  }

  Future<void> addToCart(String itemId) async {
    var item = await _cuisineItemUseCase.getInstoreItem(itemId);
    if (item.data() != null) {
      final message = _cartItemsUseCase.addToCart(
        item.data()!,
        const AuthDialog(),
        Strings.store,
      );
      addedToCart.value = message == 'Added to cart';
      shortToast(message);
    }
  }

  void save(CuisineItem cuisineItem, String store) {}

  @override
  void dispose() {
    qrviewController.value?.dispose();
    super.dispose();
  }
}
