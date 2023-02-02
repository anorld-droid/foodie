import 'package:common/common.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:log_in/src/strings.dart';
import 'package:log_in/src/widgets/log_in_dialog.dart';
import 'package:model/model.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 16.01.2023.
class LogInController extends GetxController with GetTickerProviderStateMixin {
  late final LocalAuthentication auth;
  late final AuthenticateUser _authenticateUser;
  late final UserModelUseCase _userModelUseCase;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late AnimationController animationController;

  Rx<bool> authenticated = false.obs;
  var username = ''.obs;
  Rx<String?> profilePic = ''.obs;
  Rx<String> verificationCode = ''.obs;
  Rx<bool> verificationHasPassed = false.obs;
  Rx<bool> inputValidated = false.obs;
  var searching = false.obs;


  @override
  void onInit() {
    super.onInit();
    auth = LocalAuthentication();

    _authenticateUser = Get.find();
    _userModelUseCase = UserModelUseCase();

    emailController = TextEditingController();
    passwordController = TextEditingController();

    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
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
        profilePic.value = user.photoUrl ?? '';
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

  Future<void> sigIn() async {
    searching.value = true;
    animationController.repeat();
    String message = '';
    final authInputs = await validInputs();
    if (authInputs.isNotEmpty) {
      message = await _authenticateUser.signInWithEmailPassword(
          emailAddress: authInputs['email']!,
          password: authInputs['password']!);
      if (message == 'Successful authentication.') {
        navigateToMainScreen();
      }
    }
    if (message.isNotEmpty) {
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
    searching.value = false;
    animationController.reset();
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
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
    return authInputs;
  }

  void navigateToSignup() => Get.offAllNamed<void>(Routes.signupScreen);

  void navigateToMainScreen() => Get.offAllNamed<void>(Routes.mainScreen);

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
