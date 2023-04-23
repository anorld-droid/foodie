import 'package:common/common.dart';
import 'package:cuisine_detail/src/widgets/restaurant_search_layout.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:model/model.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 16.01.2023.
class Controller extends GetxController with GetTickerProviderStateMixin {
  final CuisineItem item;
  Controller({required this.item});

  late final CartItemsUseCase _cartItemsUseCase;
  late final CuisineItemUseCase _cuisineItemUseCase;
  late final AuthenticateUser _authenticateUser;
  late final RestaurantItemUseCase _restaurantItemUseCase;

  late final TextEditingController quantityController;

  late AnimationController animationController;

  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final CommonController _mainController;

  final Rx<double> sellingPrice = 0.0.obs;
  final Rx<int> qty = 1.obs;
  final Rx<String> store = Rx('');
  final RxBool favorite = false.obs;

  // Variables for showing restaurant lists
  late final ScrollController scrollController;
  final RxBool showTopArrow = false.obs;
  final RxBool showBottomArrow = true.obs;

  //Get the theme mode state of the app
  var brightness = SchedulerBinding.instance.window.platformBrightness;
  late bool isDarkMode;

  @override
  void onInit() {
    initialize();
    setListeners();
    isFavorite(item);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();

    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
  }

  void setListeners() {
    scrollController.addListener(() {
      if (scrollController.offset <=
          scrollController.position.minScrollExtent) {
        showTopArrow.value = false;
      } else if (!showTopArrow.value) {
        showTopArrow.value = true;
      }
      if (scrollController.offset >=
          scrollController.position.maxScrollExtent) {
        showBottomArrow.value = false;
      } else if (!showBottomArrow.value) {
        showBottomArrow.value = true;
      }
    });
  }

  void initialize() {
    _mainController = Get.find<CommonController>();
    store.value = item.basicPrice.containsKey(_mainController.store.value)
        ? _mainController.store.value
        : item.basicPrice.keys.first;

    _cartItemsUseCase = CartItemsUseCase();
    _cuisineItemUseCase = CuisineItemUseCase();
    _authenticateUser = AuthenticateUser();
    _restaurantItemUseCase = RestaurantItemUseCase();

    emailController = TextEditingController();
    passwordController = TextEditingController();

    // Restaurants variables
    scrollController = ScrollController();

    isDarkMode = brightness == Brightness.dark;
  }

  void incrementQty(double basicPrice) {
    String msg = 'You\'ve reached the quantity purchase limit.';
    if (qty.value < item.limit) {
      qty.value++;
      sellingPrice.value = basicPrice * qty.value;
    } else {
      shortToast(msg);
    }
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
    cuisineItem.sellingPrice.value[store.value] = sellingPrice.value;
    cuisineItem.quantity.value = qty.value;
    final msg = _cartItemsUseCase.addToCart(
      cuisineItem,
      const AuthDialog(),
      store.value,
    );
    shortToast(msg);
  }

  void termsCondition() {}

  Future<void> addToFavorite(CuisineItem cuisineItem, String header) async {
    if (_authenticateUser.isUserSignedIn()) {
      favorite.toggle();
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
      await customDialog(
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

  Future<void> customDialog(BuildContext context, Widget authDialog) async {
    Get.bottomSheet<Widget>(
      authDialog,
      isScrollControlled: true,
      elevation: 8.0,
      barrierColor: Get.theme.colorScheme.primaryContainer,
      backgroundColor: Get.theme.colorScheme.background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }

  void changeStore(String name) {
    if (item.basicPrice.containsKey(name)) {
      store.value = name;
      sellingPrice.value = item.basicPrice[name]! * qty.value;
    } else {
      shortToast('Selected store doesn\'t offer the chosen food.');
    }
  }

  Future<void> moreOptions(String option) async {
    switch (option) {
      case 'Search restaurant':
        //TODO get current location
        var snap = _restaurantItemUseCase.get('coordinates');
        List<Restaurant> restaurants = [];
        snap.listen((event) {
          if (event.docs.isNotEmpty) {
            restaurants.clear();
            for (var doc in event.docs) {
              restaurants.add(doc.data());
            }
            customDialog(Get.context!, SearchLayout(restaurants));
          } else {
            shortToast(
                'Current location out of range. We\'ll keep you updated');
          }
        });

        break;
      default:
    }
  }
}
