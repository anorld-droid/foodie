import 'package:common/common.dart';
import 'package:domain/domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:model/model.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 19.01.2023.
class CuisineController extends GetxController {
  late final TextEditingController searchController;
  final Rx<List<CuisineModel>> items = Rx([]);
  final Rx<List<CuisineItem>> searchItems = Rx([]);
  late final FocusNode focusNode;

  final Rx<List<CartItem>> cartItems = Rx([]);
  final Rx<int> cartItemsLength = 0.obs;
  final Rx<bool> editing = false.obs;
  Rx<int> selectedChip = 10.obs;

  late final AuthenticateUser _authenticateUser;
  late final CartItemsUseCase _cartItemsUseCase;
  late final CuisineModelUseCase _cuisineModelUseCase;

  @override
  void onInit() async {
    super.onInit();

    initialize();
    setListeners();
    await loadData();
  }

  void setListeners() {
    focusNode.addListener((() {
      editing.value = focusNode.hasFocus;
    }));
  }

  void initialize() {
    _authenticateUser = Get.find();
    _cartItemsUseCase = CartItemsUseCase();
    _cuisineModelUseCase = CuisineModelUseCase();
    searchController = TextEditingController();
    focusNode = FocusNode();
  }

  Future<void> loadData() async {
    var snap = await _cuisineModelUseCase.get(_authenticateUser.getUserId()!);
    snap.listen((event) {
      items.value.clear();
      for (var item in event.docs) {
        items.value.add(item.data());
      }
      items.refresh();
    });
    getCartItems();
  }

  void getCartItems() async {
    var snap = await _cartItemsUseCase.get(_authenticateUser.getUserId()!);
    snap.listen((event) {
      cartItems.value.clear();
      for (var doc in event.docs) {
        CartItem cartItem = doc.data();
        cartItem.id = doc.id;
        cartItems.value.add(cartItem);
      }
      cartItemsLength.value = cartItems.value.length;
      cartItems.refresh();
    });
  }

  void search(String value) {
    // items.value.clear();
    //ignore: todo
    //TODO: Search from firebase,
    //use listener, remove on dispose
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
