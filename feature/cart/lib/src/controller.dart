import 'package:cart/src/widgets/dialog_layout.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:location/location.dart';
import 'package:model/model.dart';
import 'package:domain/domain.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 23.01.2023.
class CartController extends GetxController {
  final Rx<List<CartItem>> items;
  CartController({required this.items}) : super();

  late final TextEditingController nameController;
  late final TextEditingController phoneController;
  late final TextEditingController buildingController;

  late final CommonController commonController;

  late final AuthenticateUser _authenticateUser;
  late final UserModelUseCase _userModelUseCase;
  late final ShippingUseCase _shippingUseCase;
  late final CartItemsUseCase _cartItemsUseCase;
  late final SubscriptionUseCase _subscriptionUseCase;

  PhoneNumber phoneNumber = PhoneNumber(isoCode: 'KE');
  Rx<bool> inputValidated = false.obs;

  final Rx<Subscription?> subscription = Rx(null);
  final Rx<ShippingInfo?> _shippingInfo = Rx(null);
  final Rx<String> shippingAddress = Rx('');
  final Rx<bool> freeShipping = Rx(true);

  final Rx<bool> loading = false.obs;

  final Rx<double> subTotal = 0.0.obs;
  final Rx<double> total = 0.0.obs;
  final Rx<double> shippingFee = 0.0.obs;

  final Rx<int> itemLength = 0.obs;

  final Rx<String> selectedOption = 'M-pesa'.obs;

  final Rx<List<ShippingModel>> orders = Rx([]);
  //Get the theme mode state of the app

  @override
  void onInit() async {
    super.onInit();
    initialize();
    await loadData();
  }

  @override
  void onReady() async {
    super.onReady();
    await getOrders();
  }

  void initialize() {
    _authenticateUser = Get.find();
    _userModelUseCase = UserModelUseCase();
    _shippingUseCase = ShippingUseCase();
    _cartItemsUseCase = CartItemsUseCase();
    _subscriptionUseCase = SubscriptionUseCase();

    nameController = TextEditingController();
    phoneController = TextEditingController();
    buildingController = TextEditingController();

    commonController = Get.find<CommonController>();

    itemLength.value = items.value.length;
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

  Future<void> loadData() async {
    commonController.purchaseType.listen((value) {
      calculateTotal();
      calculateShippingFee();
    });

    await _subscriptionUseCase.get().then(
          (value) => value.listen((event) {
            subscription.value = event.data();
          }),
        );
    //Retrive user delivery destination
    var user =
        await _userModelUseCase.getShippingInfo(_authenticateUser.getUserId()!);
    user.listen((event) {
      User user = event.data()!;
      _shippingInfo.value = user.shippingInfo;
      getShippingInfo();
      getShippingStatus(user);
    });
  }

  void getShippingStatus(User user) {
    if (subscription.value != null) {
      freeShipping.value =
          (user.account == 'Free' || user.account == 'Platinum') &&
              subscription.value!.shippingStatus;
    }
    calculateTotal();
  }

  void getShippingInfo() {
    if (_shippingInfo.value?.name == null) {
      shippingAddress.value = 'No shipping destination, yet!';
    } else {
      shippingAddress.value =
          '${_shippingInfo.value?.name}, ${_shippingInfo.value?.phoneNumber}, ${_shippingInfo.value?.location}';
    }
  }

  void _calculateSubTotal() {
    var sum = 0.0;
    for (var item in items.value) {
      sum += item.sellingPrice.value;
    }
    subTotal.value = sum;
    calculateShippingFee();

    subTotal.refresh();
    shippingFee.refresh();
  }

  void calculateTotal() {
    _calculateSubTotal();
    total.value = subTotal.value + shippingFee.value;
    total.refresh();
  }

  void calculateShippingFee() {
    shippingFee.value =
        freeShipping.value || commonController.purchaseType.value == 'In-store'
            ? 0
            : subTotal.value * 0.2;
  }

  void checkout() async {
    double shipAmount = subscription.value?.minShipAmount.toDouble() ?? 150.00;

    if (items.value.firstWhereOrNull((element) => element.stockTag == 0) !=
        null) {
      shortToast('Kindly, remove items out of stock to proceed.');
    } else if (total.value < shipAmount) {
      shortToast(
          'We start shipping for amounts above ${CommonStrings.currency}${shipAmount.toStringAsFixed(0)}');
    } else if (_shippingInfo.value?.name == null) {
      updateShipping();
    } else if (items.value.isEmpty) {
      longToast('Add items to cart to proceed.');
    } else {
      bottomSheet(Obx(() => Payment(
            amount: total.value,
            options: const ['M-pesa', 'Airtel Money', 'Wallet'],
            shipping: shippingAddress.value,
            onPaymentSuccesful: () async {
              ShippingModel shippingModel = ShippingModel(
                  user: _shippingInfo.value!,
                  items: items.value,
                  order: 'reqID',
                  status: 'Received',
                  timeStamp: DateTime.now());
              await _shippingUseCase.upload(
                userId: _authenticateUser.getUserId()!,
                doc: commonController.purchaseType.value == 'Delivery'
                    ? 'orders'
                    : 'history',
                shippingModel: shippingModel,
              );

              items.value.clear();
              itemLength.value = items.value.length;
              items.refresh();
              calculateTotal();
              await Future<void>.delayed(const Duration(seconds: 2));
              shortToast('Checkout successful');
            },
          )));
    }
  }

  void deleteItem(CartItem item) {
    _cartItemsUseCase.delete<CartItem>(
      userId: _authenticateUser.getUserId()!,
      docId: item.id!,
    );
    items.value.removeWhere((element) => element.id == item.id);
    itemLength.value = items.value.length;
    items.refresh();
    calculateTotal();
  }

  void incrementQty(CartItem cartItem) {
    String msg = 'You\'ve reached the quantity purchase limit.';
    if (cartItem.quantity.value < cartItem.limit) {
      var qty = ++cartItem.quantity.value;
      cartItem.sellingPrice.value = cartItem.basicPrice * qty;
      calculateTotal();
    } else {
      shortToast(msg);
    }
  }

  void decrementQty(CartItem cartItem) {
    if (cartItem.quantity > 1.0) {
      var qty = --cartItem.quantity.value;
      cartItem.sellingPrice.value = cartItem.basicPrice * qty;
      calculateTotal();
    }
  }

  Future<void> saveShippingInfo() async {
    String name = nameController.text;
    String? mobileNumber = phoneNumber.phoneNumber;
    String building = buildingController.text;
    LocationData location = await Location().getLocation();

    if (validateInput(
      name,
      mobileNumber,
      building,
    )) {
      if (location.latitude != null && location.longitude != null) {
        ShippingInfo shippingInfo = ShippingInfo(
            name: name,
            phoneNumber: mobileNumber,
            location: '$building.',
            lat: location.latitude!,
            lng: location.longitude!);
        await _userModelUseCase.updateShippingInfo(
          userId: _authenticateUser.getUserId()!,
          shippingInfo: shippingInfo,
        );
        shortToast('Shipping info saved.');
        Get.back<void>();
      } else {
        shortToast('Turn on your location to proceed.');
      }
    }
  }

  bool validateInput(String name, String? phoneNumber, String building) {
    if (name.isNotEmpty &&
        phoneNumber != null &&
        inputValidated.value &&
        building.isNotEmpty) {
      return true;
    } else {
      shortToast('Please, fill all the details');
      return false;
    }
  }

  void bottomSheet(Widget widget) async {
    await Get.bottomSheet<bool?>(
      widget,
      backgroundColor: Get.theme.colorScheme.background,
      clipBehavior: Clip.hardEdge,
      elevation: 4,
      barrierColor: Get.theme.colorScheme.primaryContainer,
      isScrollControlled: false,
    );
  }

  Future<void> updateShipping() async {
    bottomSheet(const DialogLayout());
  }

  void navigateToDelivery(ShippingModel order) {
    Get.toNamed<void>(
      Routes.delivery,
      arguments: order,
    );
  }
}
