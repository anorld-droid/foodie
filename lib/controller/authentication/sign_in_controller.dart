import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trice/views/viewscreens/authentication/widgets/sign_in_dialog.dart';
import 'package:common/common.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 16.01.2023.

class SignInController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  var username = 'Username'.obs;
  @override
  void onReady() {
    super.onReady();
    usernameDialog(Get.context!);
  }

  void usernameDialog(BuildContext context) {
    showDialog<Widget>(
        context: context,
        barrierDismissible: false,
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: Colors.black45,
        builder: (BuildContext buildContext) {
          return const SignInDialog();
        });
  }

  void getUserDetails() {
    if (usernameController.text.trim().isNotEmpty) {
      Navigator.of(Get.overlayContext!).pop();
      username.value = usernameController.text;
      //TODO: fetch user details
    }
  }

  void  navigateToSignup() => Get.offAllNamed<void>(signupScreen);

  void navigateToNewsRoom() => Get.offNamed<void>(mainScreen);
}
