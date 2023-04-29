import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:common/common.dart';
import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:model/model.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 19.01.2023.
class CuisineController extends GetxController
    with GetTickerProviderStateMixin {
  late final TextEditingController nameController;
  late final TextEditingController searchController;
  late final TextEditingController phoneController;
  late final TextEditingController buildingController;

  final Rx<List<CuisineModel>> items = Rx([]);
  final Rx<List<CuisineItem>> searchItems = Rx([]);
  late final FocusNode focusNode;

  final Rx<List<CartItem>> cartItems = Rx([]);
  final Rx<int> cartItemsLength = 0.obs;
  final Rx<bool> editing = false.obs;
  Rx<int> selectedChip = 10.obs;
  final RxBool showDeliveries = false.obs;

  late final AuthenticateUser _authenticateUser;
  late final CartItemsUseCase _cartItemsUseCase;
  late final CuisineModelUseCase _cuisineModelUseCase;
  late final CuisineItemUseCase _cuisineItemUseCase;
  late final ShippingUseCase _shippingUseCase;

  late Rx<TabController> tabController;

  final Rx<double> sellingPrice = 0.0.obs;

  final Rx<int> itemLength = 0.obs;

  final Rx<List<ShippingModel>> orders = Rx([]);

  late AnimationController animationController;
  RxBool searching = false.obs;

  @override
  void onInit() async {
    super.onInit();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      // Status bar color
      statusBarColor: Get.theme.colorScheme.primaryContainer,
      // Status bar brightness (optional)
      statusBarIconBrightness: Get.theme.brightness, // For Android (dark icons)
    ));
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
    _cuisineItemUseCase = CuisineItemUseCase();
    _shippingUseCase = ShippingUseCase();

    nameController = TextEditingController();
    searchController = TextEditingController();
    phoneController = TextEditingController();
    buildingController = TextEditingController();

    focusNode = FocusNode();
    tabController = Rx(TabController(length: 0, vsync: this));

    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
  }

  Future<void> loadData() async {
    searching.value = true;
    animationController.repeat();

    var snap = await _cuisineModelUseCase.getHeaders();
    items.value = snap;
    tabController = Rx(TabController(length: items.value.length, vsync: this));
    tabController.refresh();

    if (_authenticateUser.isUserSignedIn()) {
      getCartItems();
      getOrders();
    }
    itemLength.value = items.value.length;
    await Future<void>.delayed(const Duration(milliseconds: 50));
    searching.value = false;
    animationController.reset();
  }

  Future<void> getOrders() async {
    var snap = await _shippingUseCase.get(_authenticateUser.getUserId()!);
    snap.listen((event) {
      orders.value.clear();
      for (var doc in event.docs) {
        ShippingModel model = doc.data();
        model.id = doc.id;
        orders.value.add(model);
      }
    });
  }

  Stream<QuerySnapshot<CuisineItem>> getCuisineItems(String header) {
    searching.value = true;
    animationController.repeat();
    var items = _cuisineItemUseCase.get(header);
    searching.value = false;
    animationController.reset();
    return items;
  }

  Future<void> showAuthDialog() async {
    showDialog<Widget>(
        context: Get.context!,
        barrierDismissible: false,
        barrierLabel:
            MaterialLocalizations.of(Get.context!).modalBarrierDismissLabel,
        barrierColor: Get.theme.colorScheme.background,
        builder: (BuildContext buildContext) {
          return const AuthDialog();
        });
  }

  // void resetSearch() {
  //   selectedChip.value = 10;
  //   searchController.clear();
  //   focusNode.unfocus();
  // }

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

  Future<void> search(String value) async {
    if (value.isNotEmpty) {
      searchItems.value = await _cuisineModelUseCase.search(value);
    }
  }

  void navigateToDetails(CuisineItem cuisineItem, String header) {
    Get.toNamed<void>(
      Routes.cuisineDetail,
      arguments: {'cuisineItem': cuisineItem, 'header': header},
    );
  }

  void navigateToCart() {
    Get.toNamed<void>(
      Routes.cart,
      arguments: cartItems,
    );
  }

  void navigateToDelivery(ShippingModel order) {
    Get.offAndToNamed<void>(
      Routes.delivery,
      arguments: order,
    );
  }

  void addToCart(CuisineItem cuisineItem, String store) {
    final message = _cartItemsUseCase.addToCart(
      cuisineItem,
      const AuthDialog(),
      store,
    );
    shortToast(message);
  }

  String getStore(CuisineItem cItem, String store) {
    return cItem.basicPrice.containsKey(store)
        ? store
        : cItem.basicPrice.keys.first;
  }

  void quickOptions(String option) {
    switch (option) {
      case 'Repeat last order':
        break;
      case 'My Wallet':
        Get.toNamed<void>(Routes.wallet);
        break;
      default:
        if (kDebugMode) {
          print(option);
        }
    }
  }

  void scan() {
    Get.toNamed<void>(
      Routes.instore,
    );
  }
}
