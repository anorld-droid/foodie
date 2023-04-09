import 'package:common/common.dart';
import 'package:cuisine_detail/src/strings.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:model/model.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 16.01.2023.
class Controller extends GetxController with GetTickerProviderStateMixin {
  final CuisineItem item;
  Controller({required this.item});

  late final CartItemsUseCase _cartItemsUseCase;
  late final CuisineItemUseCase _cuisineItemUseCase;
  late final AuthenticateUser _authenticateUser;

  late final TextEditingController quantityController;

  late AnimationController animationController;

  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final CommonController _mainController;

  final Rx<bool> seeMore = false.obs;
  late final Rx<double> sellingPrice = 0.0.obs;
  final Rx<int> qty = 1.obs;
  final Rx<String> store = Rx('');
  final RxBool favorite = false.obs;

  var searching = false.obs;

  @override
  void onInit() {
    super.onInit();
    initialize();
    isFavorite(item);
  }

  @override
  void onReady() {
    super.onReady();

    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
  }

  void initialize() {
    _mainController = Get.find<CommonController>();
    store.value = _mainController.store.value;

    _cartItemsUseCase = CartItemsUseCase();
    _cuisineItemUseCase = CuisineItemUseCase();
    _authenticateUser = AuthenticateUser();

    emailController = TextEditingController();
    passwordController = TextEditingController();
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

  void addToCart(
    CuisineItem cuisineItem,
  ) {
    final msg = _cartItemsUseCase.addToCart(
      cuisineItem,
      const AuthDialog(),
      store.value,
    );
    shortToast(msg);
  }

  void termsCondition() {}

  Future<void> addToFavorite(CuisineItem cuisineItem, String header) async {
    favorite.toggle();
    if (_authenticateUser.isUserSignedIn()) {
      var favorites = cuisineItem.favorites;
      var values = favorites[store.value] ?? [];

      if (values.contains(_authenticateUser.getUserId())) {
        values.remove(_authenticateUser.getUserId());
      } else {
        values.add(_authenticateUser.getUserId()!);
      }
      favorites[store.value] = values;
      _cuisineItemUseCase.update(
          childCol: header,
          childDoc: cuisineItem.id!,
          data: {'favorites': favorites});
    } else {
      await showAuthDialog(
        Get.context!,
        const AuthDialog(),
      );
    }
  }

  void isFavorite(CuisineItem cuisineItem) {
    if (_authenticateUser.isUserSignedIn()) {
      var favorites = cuisineItem.favorites;
      var values = favorites[store.value] ?? [];
      favorite.value = values.contains(_authenticateUser.getUserId());
    }
  }

  Future<void> showAuthDialog(BuildContext context, Widget authDialog) async {
    showDialog<Widget>(
        context: context,
        barrierDismissible: false,
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: Get.theme.colorScheme.primaryContainer,
        builder: (BuildContext buildContext) {
          return authDialog;
        });
  }

  void moreOptions(String option) {
    switch (option) {
      case 'Search restaurant':
        break;
      default:
    }
  }
}
