import 'package:agrich/src/strings.dart';
import 'package:common/common.dart';
import 'package:domain/domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:model/model.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 19.01.2023.
class CuisineController extends GetxController {
  late final TextEditingController searchController;
  late final List<CuisineModel> items;
  late final FocusNode focusNode;

  final List<CartItem> cartItems = [];
  final Rx<int> cartItemsLength = 0.obs;
  final Rx<bool> editing = false.obs;
  Rx<int> selectedChip = 10.obs;

  late final AuthenticateUser _authenticateUser;
  late final CartItemsUseCase _cartItemsUseCase;

  @override
  void onInit() {
    super.onInit();
    _authenticateUser = Get.find();
    _cartItemsUseCase = CartItemsUseCase();
    getCartItems();

    searchController = TextEditingController();
    focusNode = FocusNode();
    focusNode.addListener((() {
      editing.value = focusNode.hasFocus;
    }));
    loadData();
  }

  void loadData() {
    items = [
      CuisineModel(
        header: 'Dairy',
        cuisineItems: [
          CuisineItem(
              name: 'Fresh Milk',
              stockTag: StockTags.inStock.name,
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
              stockTag: StockTags.outStock.name,
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
              stockTag: StockTags.inStock.name,
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
            stockTag: StockTags.inStock.name,
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
  }

  void getCartItems() async {
    var snap = await _cartItemsUseCase.get(_authenticateUser.getUserId()!);
    snap.listen((event) {
      cartItems.clear();
      for (var doc in event.docs) {
        cartItems.add(doc.data());
      }
      cartItemsLength.value = cartItems.length;
    });
  }

  void search(String value) {
    //ignore: todo
    //TODO: Search from firebase
  }
  void navigateToDetails(CuisineItem cuisineItem) {
    Get.toNamed<void>(
      Routes.cuisineDetail,
      arguments: cuisineItem,
    );
  }

  void navigateToCart() {
    Get.toNamed<void>(
      Routes.cart,
      arguments: cartItems,
    );
  }
}
