import 'package:agrich/src/strings.dart';
import 'package:common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:model/model.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 19.01.2023.
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
              stockTag: StockTags.inStock,
              price: 55.00,
              detail:
                  'I built something similar with a CustomScrollView and SliverPersistenHeader, to get the curved effect your header can have a maxExtent and minExtent. When not scrolled the header height will show the curve otherwise when you start scrolling it will also shrink to a set height.',
              nutrients: [
                'ingridients',
                'ingridient',
                'ingridiens',
                'ingridiets',
                'ingridints',
                'ingridents',
                'ingriients'
              ],
              photoUrl: Strings.milkUrl),
          CuisineItem(
              name: 'Fresh Milk',
              stockTag: StockTags.outStock,
              price: 55.00,
              detail: 'detail',
              nutrients: [
                'ingridients',
                'ingridient',
                'ingridiens',
                'ingridiets',
                'ingridints',
                'ingridents',
                'ingriients'
              ],
              photoUrl: Strings.milkUrl),
          CuisineItem(
              name: 'Fresh Milk',
              stockTag: StockTags.inStock,
              price: 55.00,
              detail: 'detail',
              nutrients: [
                'ingridients',
                'ingridient',
                'ingridiens',
                'ingridiets',
                'ingridints',
                'ingridents',
                'ingriients'
              ],
              photoUrl: Strings.milkUrl),
        ],
      ),
      CuisineModel(header: 'Beverages', cuisineItems: [
        CuisineItem(
            name: 'Water',
            stockTag: StockTags.inStock,
            price: 60.00,
            detail: 'detail',
            nutrients: [
              'ingridients',
              'ingridient',
              'ingridiens',
              'ingridiets',
              'ingridints',
              'ingridents',
              'ingriients'
            ],
            photoUrl: Strings.waterUrl),
      ]),
    ];
    itemsLength = items.length;
  }

  void search(String value) {
    //ignore: todo
    //TODO: Search from firebase
  }
  void navigateToDetails(CuisineItem cuisineItem) {
    Get.toNamed<void>(Routes.cuisineDetail, arguments: cuisineItem);
  }
}
