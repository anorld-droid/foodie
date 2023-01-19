import 'package:agrich/src/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:model/model.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 19.01.2023.
class CuisineController extends GetxController {
  late final TextEditingController searchController;
  late final List<CuisineModel> items;
  late final int itemsLength;
  @override
  void onInit() {
    super.onInit();
    searchController = TextEditingController();
    loadData();
  }

  void loadData() {
    items = [
      CuisineModel(header: 'Dairy', cuisineItems: [
        CuisineItem(
            name: 'Fresh Milk',
            tag: Tags.basic,
            price: 55.00,
            detail: 'detail',
            ingridients: ['ingridients'],
            photoUrl: Strings.milkUrl),
      ]),
      CuisineModel(header: 'Beverages', cuisineItems: [
        CuisineItem(
            name: 'Water',
            tag: Tags.basic,
            price: 60.00,
            detail: 'detail',
            ingridients: ['ingridients'],
            photoUrl: Strings.waterUrl),
      ]),
      CuisineModel(header: 'Dairy', cuisineItems: [
        CuisineItem(
            name: 'Fresh Milk',
            tag: Tags.basic,
            price: 55.00,
            detail: 'detail',
            ingridients: ['ingridients'],
            photoUrl: Strings.milkUrl),
      ]),
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
}
