import 'package:agrich/src/widgets/dialog_layout.dart';
import 'package:agrich/src/widgets/shipping_dialog_layout.dart';
import 'package:agrich/src/widgets/subscription.dart';
import 'package:common/common.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:model/model.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 19.01.2023.
class CuisineController extends GetxController
    with GetTickerProviderStateMixin {
  late final TextEditingController nameController;
  late final TextEditingController searchController;
  late final TextEditingController phoneController;

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
  late final UserModelUseCase _userModelUseCase;
  late final ShippingUseCase _shippingUseCase;
  late final PaymentOptionsUseCase _paymentOptionsUseCase;
  late final GetDestinationsUseCase _getDestinationsUseCase;
  late final SendMessageUseCase _sendMessageUseCase;
  PhoneNumber phoneNumber = PhoneNumber(isoCode: 'KE');

  final Rx<String> accountType = ''.obs;

  final Rx<int> qty = 1.obs;

  late final TabController tabController;

  late final Rx<double> sellingPrice = 0.0.obs;

  Rx<bool> inputValidated = false.obs;

  final Rx<double> subTotal = 0.0.obs;
  final Rx<double> total = 0.0.obs;
  final Rx<double> shippingFee = 0.0.obs;

  final Rx<Subscription?> subscription = Rx(null);
  final Rx<String> shippingAddress = Rx('');
  final Rx<bool> freeShipping = Rx(true);
  final Rx<ShippingInfo?> _shippingInfo = Rx(null);

  final Rx<Destinations> destinations =
      Rx(const Destinations(destinations: {}));
  final Rx<String> county = Rx('');
  final Rx<String> town = Rx('');

  final Rx<int> itemLength = 0.obs;

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
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      // Status bar color
      statusBarColor: Get.theme.backgroundColor,
      // Status bar brightness (optional)
      statusBarIconBrightness: Get.theme.brightness, // For Android (dark icons)
    ));

    _authenticateUser = Get.find();
    _cartItemsUseCase = CartItemsUseCase();
    _cuisineModelUseCase = CuisineModelUseCase();
    _userModelUseCase = UserModelUseCase();
    _shippingUseCase = ShippingUseCase();
    _paymentOptionsUseCase = PaymentOptionsUseCase();
    _getDestinationsUseCase = GetDestinationsUseCase();
    _sendMessageUseCase = SendMessageUseCase();

    nameController = TextEditingController();
    searchController = TextEditingController();
    phoneController = TextEditingController();
    focusNode = FocusNode();

    tabController = TabController(length: 2, vsync: this);
  }

  Future<void> loadData() async {
    var snap = await _cuisineModelUseCase.get();
    snap.listen((event) {
      items.value.clear();
      for (var item in event.docs) {
        items.value.add(item.data());
      }
      items.refresh();
    });
    if (_authenticateUser.isUserSignedIn()) {
      getCartItems();
      var user = await _userModelUseCase.get(_authenticateUser.getUserId()!);
      accountType.value = user!.account == 'Gold'
          ? '6000'
          : user.account == 'Platinum'
              ? '3000'
              : '0';
    }
    //Retrive autone's delivery destinations
    var snapshot = await _getDestinationsUseCase.get();
    snapshot.listen((event) {
      destinations.value = event.data() ??
          const Destinations(
            destinations: {},
          );
    });
    itemLength.value = items.value.length;
  }

  Future<void> subscriptionOptions() async {
    Get.bottomSheet<bool?>(const SubscriptionLayout(),
        barrierColor: Get.theme.primaryColorDark.withOpacity(.1),
        backgroundColor: Get.theme.backgroundColor,
        elevation: 4,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(16.0),
            right: Radius.circular(16.0),
          ),
        ),
        isScrollControlled: true);
  }

  Future<void> upgradeAccount(String amount, String type) async {
    await showDialog<Widget>(
        context: Get.context!,
        barrierDismissible: false,
        barrierLabel:
            MaterialLocalizations.of(Get.context!).modalBarrierDismissLabel,
        barrierColor: Get.theme.backgroundColor.withOpacity(.87),
        builder: (BuildContext buildContext) {
          return DialogLayout(amount: amount, type: type);
        });
  }

  Future<void> pay(String amount, String type) async {
    if (phoneNumber.phoneNumber != null && inputValidated.value) {
      final reqID = await _paymentOptionsUseCase.withMPesa(
          _authenticateUser.getUserId()!,
          amount,
          phoneNumber.phoneNumber!,
          'account upgrade');
      if (reqID != null) {
        Get.back<void>();
        final snap = await _paymentOptionsUseCase
            .getPaymentStatus<MpesaResultPayment>(reqId: reqID);
        snap.listen((event) async {
          var snapshot =
              event.docs.firstWhereOrNull((element) => element.id == reqID);
          if (snapshot != null) {
            var data = MpesaResultPayment.fromJson(
                snapshot.data()['stkCallback'] as Map<String, dynamic>);
            if (data.responseCode == 0) {
              await _userModelUseCase.updateAccountType(
                  userId: _authenticateUser.getUserId()!, accountType: type);
              await Future<void>.delayed(const Duration(seconds: 2));
              shortToast('Upgrade successful');
            } else {
              longToast(data.responseDescription);
            }
          }
        });
      } else {
        longToast('Payment operation failed.');
      }
    } else {
      longToast('Enter your phone number.');
    }
  }

  void sendMessage() {
    String text =
        'You\'ve unlocked a life of ease and convenience with autone. Welcome autonister!';
    MessageBird sms = MessageBird(to: phoneNumber.phoneNumber!, text: text);
    _sendMessageUseCase.invoke(messageBird: sms);
  }

  void resetSearch() {
    selectedChip.value = 10;
    searchController.clear();
    focusNode.unfocus();
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

  Future<void> search(String value) async {
    searchItems.value = await _cuisineModelUseCase.search(value);
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

  void checkout() async {
    double shipAmount = subscription.value?.minShipAmount.toDouble() ?? 150.00;
    if (total.value < shipAmount) {
      shortToast(
          'We start shipping for amounts above ${CommonStrings.currency}${shipAmount.toStringAsFixed(0)}');
    } else if (_shippingInfo.value?.name == null) {
      shippingDialog();
    } else if (items.value.isEmpty) {
      longToast('Add items to cart to proceed.');
    } else {
      await _transact();
      sendOrderMessage();
    }
  }

  Future<void> _transact() async {
    final reqID = await _paymentOptionsUseCase.withMPesa(
        _authenticateUser.getUserId()!,
        total.value.toStringAsFixed(0),
        _shippingInfo.value!.phoneNumber!,
        'food items');
    if (reqID != null) {
      final querySnapshot = await _paymentOptionsUseCase
          .getPaymentStatus<MpesaResultPayment>(reqId: reqID);
      querySnapshot.listen((event) async {
        var element =
            event.docs.firstWhereOrNull((element) => element.id == reqID);
        if (element != null) {
          var data = MpesaResultPayment.fromJson(
              element.data()['stkCallback'] as Map<String, dynamic>);
          if (data.responseCode == 0) {
            ShippingModel shippingModel = ShippingModel(
              uid: _authenticateUser.getUserId()!,
              items: cartItems.value,
              orderNo: reqID,
              status: ShippingStatus.none.name,
            );
            await _shippingUseCase.upload(
              userId: _authenticateUser.getUserId()!,
              shippingModel: shippingModel,
            );
            cartItems.value.clear();
            itemLength.value = items.value.length;
            cartItems.refresh();
            calculateTotal();
            await Future<void>.delayed(const Duration(seconds: 2));
            shortToast('Checkout successful');
          } else {
            longToast(data.responseDescription);
          }
        }
      });
    } else {
      longToast('Payment operation failed.');
    }
  }

  void sendOrderMessage() {
    String text = 'Your order has been received and is being processed.';
    MessageBird sms =
        MessageBird(to: _shippingInfo.value!.phoneNumber!, text: text);
    _sendMessageUseCase.invoke(messageBird: sms);
  }

  void deleteItem(CartItem item) {
    _cartItemsUseCase.delete(
      userId: _authenticateUser.getUserId()!,
      docId: item.id!,
    );
    cartItems.value.removeWhere((element) => element.id == item.id);
    itemLength.value = cartItems.value.length;
    cartItems.refresh();
    calculateTotal();
  }

  Future<void> shippingDialog() async {
    await showDialog<Widget>(
        context: Get.context!,
        barrierDismissible: false,
        barrierLabel:
            MaterialLocalizations.of(Get.context!).modalBarrierDismissLabel,
        barrierColor: Get.theme.backgroundColor.withOpacity(.87),
        builder: (BuildContext buildContext) {
          return const ShippingDialogLayout();
        });
  }

  void _calculateSubTotal() {
    var sum = 0.0;
    for (var item in cartItems.value) {
      sum += item.sellingPrice.value;
    }
    subTotal.value = sum;
    shippingFee.value = freeShipping.value ? 0 : sum * 0.2;

    subTotal.refresh();
    shippingFee.refresh();
  }

  void calculateTotal() {
    _calculateSubTotal();
    total.value = subTotal.value + shippingFee.value;
    total.refresh();
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

  Future<void> saveShippingInfo() async {
    String name = nameController.text;
    String? mobileNumber = phoneNumber.phoneNumber;
    String countyValue = county.value;
    String townValue = town.value;

    if (validateInput(
      name,
      mobileNumber,
      countyValue,
      townValue,
    )) {
      ShippingInfo shippingInfo = ShippingInfo(
        name: name,
        phoneNumber: mobileNumber,
        destination: DestinationModel(
          county: countyValue,
          town: townValue,
        ),
      );
      await _userModelUseCase.updateShippingInfo(
        userId: _authenticateUser.getUserId()!,
        shippingInfo: shippingInfo,
      );
      shortToast('Shipping info saved.');
      Get.back<void>();
    }
  }

  bool validateInput(
      String name, String? phoneNumber, String county, String town) {
    if (name.isNotEmpty &&
        phoneNumber != null &&
        county.isNotEmpty &&
        town.isNotEmpty &&
        inputValidated.value) {
      return true;
    } else {
      shortToast('Please, fill all the details');
      return false;
    }
  }
}
