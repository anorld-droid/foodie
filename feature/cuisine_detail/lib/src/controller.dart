import 'package:common/common.dart';
import 'package:domain/domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:model/model.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 16.01.2023.
class Controller extends GetxController {
  late final AuthenticateUser _authenticateUser;
  late final CartItemsUseCase _cartItemsUseCase;

  late final TextEditingController quantityController;

  final Rx<bool> seeMore = false.obs;
  late final Rx<double> sellingPrice = 0.0.obs;
  final Rx<int> qty = 1.obs;

  @override
  void onReady() {
    super.onReady();
    _authenticateUser = Get.find();
    _cartItemsUseCase = CartItemsUseCase();
  }

  void incrementQty(double basicPrice) {
    qty.value++;
    sellingPrice.value = basicPrice * qty.value;
  }

  void decrementQty(double basicPrice) {
    if (qty.value > 1.0) {
      qty.value--;
      sellingPrice.value = basicPrice * qty.value;
    }
  }

  void resetSellingPrice() {
    sellingPrice.value = 0;
  }

  void addToCart(CuisineItem cuisineItem) {
    _cartItemsUseCase.upload(
      docPath: _authenticateUser.getUserId()!,
      cartItem: cuisineItem.asCartItem(qty.value),
    );
    shortToast('Added to cart');
  }
}
