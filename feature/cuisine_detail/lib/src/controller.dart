import 'package:common/common.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:model/model.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 16.01.2023.
class Controller extends GetxController with GetTickerProviderStateMixin {
  late final CartItemsUseCase _cartItemsUseCase;

  late final TextEditingController quantityController;

  late AnimationController animationController;

  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  final Rx<bool> seeMore = false.obs;
  late final Rx<double> sellingPrice = 0.0.obs;
  final Rx<int> qty = 1.obs;

  var searching = false.obs;

  @override
  void onReady() {
    super.onReady();
    _cartItemsUseCase = CartItemsUseCase();

    emailController = TextEditingController();
    passwordController = TextEditingController();

    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
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
    _cartItemsUseCase.addToCart(
      cuisineItem,
      const AuthDialog(),
    );
  }

  void termsCondition() {}
}
