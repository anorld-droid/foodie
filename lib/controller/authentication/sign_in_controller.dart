import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trice/views/routing/routes.dart';
import 'package:trice/views/viewscreens/authentication/widgets/sign_in_dialog.dart';

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

  void  navigateToSignup() => Get.offAllNamed<String>(signupScreen);

  void navigateToNewsRoom() => Get.offNamed<String>(mainScreen);
}
