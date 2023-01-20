import 'package:agrich/src/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:model/model.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 19.01.2023.
enum Chips implements NamedEnum {
  dairy,
  beverage,
  fruits,
  vegetables,
  meat,
  grocery,
  legumes,
  grains,
  combo;

  @override
  String get name {
    switch (this) {
      case Chips.dairy:
        return 'Dairy';
      case Chips.beverage:
        return 'Beverage';
      case Chips.fruits:
        return 'Fruits';
      case Chips.vegetables:
        return 'Vegetables';
      case Chips.meat:
        return 'Meat';
      case Chips.grocery:
        return 'Grocery';
      case Chips.legumes:
        return 'Legumes';
      case Chips.grains:
        return 'Grains';
      case Chips.combo:
        return 'Combo';
    }
  }
}

class CuisineController extends GetxController {
  late final TextEditingController searchController;
  late final List<CuisineModel> items;
  late final int itemsLength;
  late final List<CuisineItem> cartItems;
  late final FocusNode focusNode;
  final Rx<bool> editing = false.obs;
  Rx<int> selectedChip = 10.obs;
  @override
  void onInit() {
    super.onInit();
    searchController = TextEditingController();
    focusNode = FocusNode();
    focusNode.addListener((() {
      editing.value = focusNode.hasFocus;
    }));
    loadData();
  }

  void loadData() {
    cartItems = [];
    items = [
      CuisineModel(
        header: 'Dairy',
        cuisineItems: [
          CuisineItem(
              name: 'Fresh Milk',
              tag: Tags.basic,
              price: 55.00,
              detail: 'detail',
              ingridients: ['ingridients'],
              photoUrl: Strings.milkUrl),
          CuisineItem(
              name: 'Fresh Milk',
              tag: Tags.basic,
              price: 55.00,
              detail: 'detail',
              ingridients: ['ingridients'],
              photoUrl: Strings.milkUrl),
          CuisineItem(
              name: 'Fresh Milk',
              tag: Tags.basic,
              price: 55.00,
              detail: 'detail',
              ingridients: ['ingridients'],
              photoUrl: Strings.milkUrl),
        ],
      ),
      CuisineModel(header: 'Beverages', cuisineItems: [
        CuisineItem(
            name: 'Water',
            tag: Tags.basic,
            price: 60.00,
            detail: 'detail',
            ingridients: ['ingridients'],
            photoUrl: Strings.waterUrl),
      ]),
    ];
    itemsLength = items.length;
  }

  void search(String value) {
    //ignore: todo
    //TODO: Search from firebase
  }
}
