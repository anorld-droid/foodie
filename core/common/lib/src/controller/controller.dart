import 'package:common/common.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:model/model.dart';

class Controller extends GetxController with GetTickerProviderStateMixin {
  late final TabController tabController;

  late final AuthenticateUser _authenticateUser;
  late final UserModelUseCase _userModelUseCase;

  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  late AnimationController animationController;
  var searching = false.obs;

  late OnboardingStatus _onboardingStatus;

  @override
  void onReady() {
    super.onReady();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
  }

  @override
  void onInit() {
    super.onInit();
    initialize();
  }

  void initialize() {
    _authenticateUser = Get.find();
    _onboardingStatus = OnboardingStatus();
    _userModelUseCase = UserModelUseCase();
    // _paymentOptionsUseCase = PaymentOptionsUseCase();
    // _sendMessageUseCase = SendMessageUseCase();

    emailController = TextEditingController();
    passwordController = TextEditingController();
    // focusNode = FocusNode();

    tabController = TabController(length: 2, vsync: this);
  }

  Future<void> sigIn() async {
    searching.value = true;
    animationController.repeat();
    String message = '';
    final authInputs = await validInputs();
    if (authInputs.isNotEmpty) {
      message = await _authenticateUser.signInWithEmailPassword(
          emailAddress: authInputs['email']!,
          password: authInputs['password']!);
      shortToast(message);
    }
    if (message.isNotEmpty) {
      shortToast(message);
    }
    searching.value = false;
    animationController.reset();
  }

  Future<void> createAccount() async {
    searching.value = true;
    animationController.repeat();
    var message = '';
    final authInputs = await validInputs();
    if (authInputs.isNotEmpty) {
      message = await _authenticateUser.createAccount(
          emailAddress: authInputs['email']!,
          password: authInputs['password']!);
      if (message == 'Account created successfully') {
        await _uploadUserInfo(_authenticateUser.getUserName() ?? 'Anonymous');
        await _onboardingStatus.update(true);
      }
    }
    if (message.isNotEmpty) {
      shortToast(message);
    }
    searching.value = false;
    animationController.reset();
  }

  Future<void> _uploadUserInfo(String username) async {
    var message = 'Sign up failed, please try again';
    String? uid = _authenticateUser.getUserId();
    final User user =
        User(uid: uid!, photoUrl: null, username: username, shippingInfo: null);
    _userModelUseCase.upload(uid, user);
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
}
