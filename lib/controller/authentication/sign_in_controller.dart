import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trice/views/routing/routes.dart';
import 'package:trice/views/viewscreens/authentication/widgets/sign_in_dialog.dart';

class SignInController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  var username = "Username".obs;
  @override
  void onReady() {
    super.onReady();
    usernameDialog(Get.context!);
  }

  void usernameDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: Colors.black45,
        builder: (BuildContext buildContext) {
          return const SignInDialog();
        });
  }

  getUserDetails() {
    if (usernameController.text.trim().isNotEmpty) {
      Navigator.of(Get.overlayContext!).pop();
      username.value = usernameController.text;
      //TODO: fetch user details
    }
  }

  navigateToSignup() => Get.offNamed(signup);

  navigateToNewsRoom() => Get.offNamed(mainScreen);
}
