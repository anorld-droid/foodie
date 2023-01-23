import 'package:cart/src/utils/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:model/model.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 23.01.2023.
class Controller extends GetxController {
  late final TextEditingController buildingController;
  late final TextEditingController floorController;
  late final TextEditingController roomController;
  late final TextEditingController landmarkController;

  final Rx<String> destination = KisumuDestinations.milimani.name.obs;
  final Rx<List<CartItem>> cartItems = Rx([]);

  @override
  void onInit() {
    super.onInit();
    initializeVar();
    loadData();
  }

  void initializeVar() {
    buildingController = TextEditingController();
    floorController = TextEditingController();
    roomController = TextEditingController();
    landmarkController = TextEditingController();
  }

  void loadData() {
    cartItems.value = [
      CartItem(
        photoUrl: Strings.milkUrl,
        name: 'Fresh Milk',
        stockTag: StockTags.inStock,
        price: 56.98,
        quantity: 2,
      ),
      CartItem(
        photoUrl: Strings.milkUrl,
        name: 'Fresh Milk',
        stockTag: StockTags.inStock,
        price: 56.98,
        quantity: 2,
      ),
      CartItem(
        photoUrl: Strings.milkUrl,
        name: 'Fresh Milk',
        stockTag: StockTags.inStock,
        price: 56.98,
        quantity: 2,
      ),
    ];
  }

  void deleteItem() {
    //ignore: todo
    //TODO FUnctionality
  }

  void incrementQty() {
    //ignore: todo
    //TODO FUnctionality
  }

  void decrementQty() {
    //ignore: todo
    //TODO FUnctionality
  }
  double subTotal() {
    var sum = 0.0;
    for (var item in cartItems.value) {
      sum += item.price;
    }
    return sum;
  }

  double shippingFee() {
    return subTotal() * 0.2;
  }

  double total() {
    return subTotal() + shippingFee();
  }
}
