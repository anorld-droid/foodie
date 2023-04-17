import 'package:cart/src/widgets/dialog_layout.dart';
import 'package:cart/src/widgets/payment.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:model/model.dart';
import 'package:domain/domain.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 23.01.2023.
class CartController extends GetxController {
  final Rx<List<CartItem>> items;
  CartController({required this.items}) : super();

  late final TextEditingController nameController;
  late final TextEditingController phoneController;
  late final TextEditingController buildingController;

  late final AuthenticateUser _authenticateUser;
  late final UserModelUseCase _userModelUseCase;
  late final ShippingUseCase _shippingUseCase;
  late final CartItemsUseCase _cartItemsUseCase;
  late final PaymentOptionsUseCase _paymentOptionsUseCase;
  late final SendMessageUseCase _sendMessageUseCase;
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
    _sendMessageUseCase = SendMessageUseCase();
    _subscriptionUseCase = SubscriptionUseCase();
    _paymentOptionsUseCase = PaymentOptionsUseCase();

    nameController = TextEditingController();
    phoneController = TextEditingController();
    buildingController = TextEditingController();

    itemLength.value = items.value.length;
  }

  Future<void> getOrders() async {
    var snap = await _shippingUseCase.get(_authenticateUser.getUserId()!);
    snap.listen((event) {
      orders.value.clear();
      for (var doc in event.docs) {
        orders.value.add(doc.data());
      }
    });
  }

  Future<void> loadData() async {
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
      phoneController.text = _shippingInfo.value?.phoneNumber?.substring(
            4,
          ) ??
          '';
    }
  }

  void _calculateSubTotal() {
    var sum = 0.0;
    for (var item in items.value) {
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

  Future<void> shippingDialog() async {
    await showDialog<Widget>(
        context: Get.context!,
        barrierDismissible: false,
        barrierLabel:
            MaterialLocalizations.of(Get.context!).modalBarrierDismissLabel,
        barrierColor: Get.theme.colorScheme.background,
        builder: (BuildContext buildContext) {
          return const DialogLayout();
        });
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
      shippingDialog();
    } else if (items.value.isEmpty) {
      longToast('Add items to cart to proceed.');
    } else {
      // bottomSheet();
      await _transact();
      // sendMessage();
    }
  }

  void pay() {
    switch (selectedOption.value) {
      case 'Airtel Money':
        break;
      default:
    }
  }

  Future<void> _transact() async {
    final reqID = await _paymentOptionsUseCase.withMPesa(
      _authenticateUser.getUserId()!,
      total.value.toStringAsFixed(0),
      _shippingInfo.value!.phoneNumber!,
      'food items',
    );
    if (reqID != null) {
      final snap = await _paymentOptionsUseCase
          .getPaymentStatus<MpesaResultPayment>(reqId: reqID);
      snap.listen((event) async {
        var element =
            event.docs.firstWhereOrNull((element) => element.id == reqID);
        if (element != null) {
          var data = MpesaResultPayment.fromJson(
              element.data()['stkCallback'] as Map<String, dynamic>);
          if (data.responseCode == 0) {
            ShippingModel shippingModel = ShippingModel(
                user: _shippingInfo.value!,
                items: items.value,
                order: 'reqID',
                status: 'Received');
            await _shippingUseCase.upload(
              userId: _authenticateUser.getUserId()!,
              shippingModel: shippingModel,
            );

            items.value.clear();
            itemLength.value = items.value.length;
            items.refresh();
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

  void sendMessage() {
    String text = 'Your order has been received and is being processed.';
    MessageBird sms =
        MessageBird(to: _shippingInfo.value!.phoneNumber!, text: text);
    _sendMessageUseCase.invoke(messageBird: sms);
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
    var qty = ++cartItem.quantity.value;
    cartItem.sellingPrice.value = cartItem.basicPrice * qty;
    calculateTotal();
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

    if (validateInput(
      name,
      mobileNumber,
      building,
    )) {
      ShippingInfo shippingInfo = ShippingInfo(
        name: name,
        phoneNumber: mobileNumber,
        location: '$building.',
      );
      await _userModelUseCase.updateShippingInfo(
        userId: _authenticateUser.getUserId()!,
        shippingInfo: shippingInfo,
      );
      shortToast('Shipping info saved.');
      Get.back<void>();
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

  void bottomSheet() async {
    await Get.bottomSheet<bool?>(
      const Payment(),
      backgroundColor: Get.theme.colorScheme.background,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(12.0))),
      clipBehavior: Clip.hardEdge,
      elevation: 4,
      barrierColor: Get.theme.colorScheme.primaryContainer,
      isScrollControlled: false,
    );
  }

  void navigateToDelivery(ShippingModel order) {
    Get.toNamed<void>(
      Routes.delivery,
      arguments: order,
    );
  }
}
