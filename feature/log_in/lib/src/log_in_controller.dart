import 'package:common/common.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:local_auth/local_auth.dart';
import 'package:log_in/src/strings.dart';
import 'package:log_in/src/widgets/log_in_dialog.dart';
import 'package:model/model.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 16.01.2023.
class LogInController extends GetxController with GetTickerProviderStateMixin {
  late final LocalAuthentication auth;
  late final AuthenticateUser _authenticateUser;
  late final UserModelUseCase _userModelUseCase;
  late final TextEditingController phoneNumberController;
  late final TextEditingController verificationController;
  late AnimationController animationController;

  Rx<bool> authenticated = false.obs;
  var username = ''.obs;
  var profilePic = ''.obs;
  Rx<String> verificationCode = ''.obs;
  Rx<bool> verificationHasPassed = false.obs;
  Rx<bool> inputValidated = false.obs;
  var searching = false.obs;

  PhoneNumber phoneNumber = PhoneNumber(isoCode: 'KE');

  @override
  void onInit() {
    super.onInit();
    auth = LocalAuthentication();

    _authenticateUser = Get.find();
    _userModelUseCase = UserModelUseCase();

    phoneNumberController = TextEditingController();
    verificationController = TextEditingController();

    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animationController.repeat();
  }

  @override
  void onReady() {
    super.onReady();
    loadData();
  }

  void loadData() async {
    if (_authenticateUser.isUserSignedIn()) {
      User? user = await _userModelUseCase.get(_authenticateUser.getUserId()!);
      if (user != null) {
        username.value = user.username;
        profilePic.value = user.photoUrl;
      }

      fingerprintAuth();
    } else {
      logInDialog(Get.context!);
    }
  }

  void logInDialog(BuildContext context) {
    showDialog<Widget>(
        context: context,
        barrierDismissible: false,
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: Colors.black87,
        builder: (BuildContext buildContext) {
          return const LogInDialog();
        });
  }

  void fingerprintAuth() async {
    try {
      authenticated.value = await auth.authenticate(
        localizedReason: Strings.localizedReason,
        options: const AuthenticationOptions(
            stickyAuth: true, useErrorDialogs: false),
      );
    } on PlatformException catch (e) {
      //ignore: todo
      //TODO Log to crashlytics
      debugPrint(e.message);
    }

    if (authenticated.value) {
      navigateToMainScreen();
    }
  }

  Future<void> verifyNumber() async {
    searching.value = true;
    if (inputValidated.value) {
      await _authenticateUser.withPhoneNUmber(phoneNumber.phoneNumber!,
          verificationCompleted: (bool value) {
        verificationHasPassed.value = value;
        navigateToMainScreen();
      });
    }
    searching.value = false;
  }

  void onCodeReceived() {
    _authenticateUser.onCodeSent(verificationCode.value);
  }

  void navigateToSignup() => Get.offAllNamed<void>(Routes.signupScreen);

  void navigateToMainScreen() => Get.offAllNamed<void>(Routes.mainScreen);
}
