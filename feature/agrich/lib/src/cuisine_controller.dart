import 'package:agrich/src/widgets/dialog_layout.dart';
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
  late final PaymentOptionsUseCase _paymentOptionsUseCase;
  late final SendMessageUseCase _sendMessageUseCase;
  PhoneNumber phoneNumber = PhoneNumber(isoCode: 'KE');

  final Rx<String> accountType = ''.obs;

  late final TabController tabController;

  Rx<bool> inputValidated = false.obs;

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
    _paymentOptionsUseCase = PaymentOptionsUseCase();
    _sendMessageUseCase = SendMessageUseCase();

    searchController = TextEditingController();
    phoneController = TextEditingController();
    focusNode = FocusNode();

    tabController = TabController(length: 3, vsync: this);
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
    getCartItems();
    var user = await _userModelUseCase.get(_authenticateUser.getUserId()!);
    accountType.value = user!.account == 'Gold'
        ? '6000'
        : user.account == 'Platinum'
            ? '3000'
            : '0';
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
    Get.back<void>();
    if (phoneNumber.phoneNumber != null && inputValidated.value) {
      final reqID = await _paymentOptionsUseCase.withMPesa(
          _authenticateUser.getUserId()!,
          amount,
          phoneNumber.phoneNumber!,
          'account upgrade');
      if (reqID != null) {
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
}
