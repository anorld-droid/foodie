import 'package:common/common.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:model/model.dart';

class CommonController extends GetxController with GetTickerProviderStateMixin {
  late final TabController tabController;

  late final AuthenticateUser _auth;
  late final UserModelUseCase _user;
  late final PaymentOptionsUseCase _payment;

  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController phoneController;

  late AnimationController animationController;
  final Rx<String> store = Rx('');

  var searching = false.obs;

  final Rx<String> selectedOption = 'M-pesa'.obs;

  final Rx<User?> user = Rx(null);
  PhoneNumber phoneNumber = PhoneNumber(isoCode: 'KE');
  Rx<bool> inputValidated = false.obs;

  @override
  void onReady() {
    super.onReady();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
  }

  @override
  void onInit() async {
    await init();
    await loadData();
    super.onInit();
  }

  Future<void> init() async {
    _auth = Get.find();
    _user = UserModelUseCase();
    _payment = PaymentOptionsUseCase();

    emailController = TextEditingController();
    passwordController = TextEditingController();
    phoneController = TextEditingController();

    tabController = TabController(length: 2, vsync: this);

    if (_auth.isUserSignedIn()) {
      User? user = await _user.get(_auth.getUserId()!);
      store.value = user!.favoriteStore;
    }
  }

  Future<void> loadData() async {
    user.value = await _user.get(_auth.getUserId()!);
  }

  Future<void> sigIn() async {
    searching.value = true;
    animationController.repeat();
    String message = '';
    final authInputs = await validInputs();
    if (authInputs.isNotEmpty) {
      message = await _auth.signInWithEmailPassword(
          emailAddress: authInputs['email']!,
          password: authInputs['password']!);
      shortToast(message);
    }
    if (message.isNotEmpty) {
      shortToast(message);
    }
    searching.value = false;
    animationController.reset();
    if (_auth.isUserSignedIn()) {
      Get.back<void>();
    }
  }

  Future<void> createAccount() async {
    searching.value = true;
    animationController.repeat();
    var message = '';
    final authInputs = await validInputs();
    if (authInputs.isNotEmpty) {
      message = await _auth.createAccount(
          emailAddress: authInputs['email']!,
          password: authInputs['password']!);
      if (message == 'Account created successfully') {
        Wallet wallet = Wallet(
            balance: 0,
            borrowed: 0.0,
            creditLimit: 0.0,
            validThru: DateTime.now());
        await _uploadUserInfo(_auth.getUserName() ?? 'Anonymous');
        await _user.uploadWalletInfo(_auth.getUserId()!, wallet);
      }
    }
    if (message.isNotEmpty) {
      shortToast(message);
    }
    searching.value = false;
    animationController.reset();
    if (_auth.isUserSignedIn()) {
      Get.back<void>();
    }
  }

  Future<void> _uploadUserInfo(String username) async {
    var message = 'Sign up failed, please try again';
    String? uid = _auth.getUserId();
    final User user =
        User(uid: uid!, photoUrl: null, username: username, shippingInfo: null);
    _user.upload(uid, user);
    message = 'Account created successfully';

    shortToast(message);
  }

  Future<Map<String, String>> validInputs() async {
    final emailAddress = emailController.text;
    final password = passwordController.text;
    var message = '';
    Map<String, String> authInputs = {};
    if (!(emailAddress.isEmail) && emailAddress.isEmpty) {
      message = 'Invalid email address';
    } else if (password.isEmpty) {
      message = 'Invalid password.';
    } else {
      authInputs = {'email': emailAddress, 'password': password};
    }
    if (message.isNotEmpty) {
      shortToast(message);
    }
    return authInputs;
  }

  Future<void> pay(double amount, Function() onPaymentSuccesful) async {
    switch (selectedOption.value) {
      case 'M-pesa':
        await mpesaPay(amount, onPaymentSuccesful);
        break;
      default:
    }
  }

  Future<void> mpesaPay(double amount, Function() onPaymentSuccesful) async {
    final reqID = await _payment.withMPesa(
      _auth.getUserId()!,
      amount.ceil().toString(),
      user.value!.shippingInfo!.phoneNumber!,
      'foodie payment',
    );
    if (reqID != null) {
      final snap =
          await _payment.getPaymentStatus<MpesaResultPayment>(reqId: reqID);
      snap.listen((event) async {
        var element =
            event.docs.firstWhereOrNull((element) => element.id == reqID);
        if (element != null) {
          var data = MpesaResultPayment.fromJson(
              element.data()['stkCallback'] as Map<String, dynamic>);
          if (data.responseCode == 0) {
            onPaymentSuccesful();
            Get.back<void>();
          } else {
            longToast(data.responseDescription);
          }
        }
      });
    } else {
      longToast('Payment operation failed.');
    }
  }
}
