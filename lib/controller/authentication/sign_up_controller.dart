import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trice/views/routing/routes.dart';
import 'package:trice/views/viewscreens/authentication/widgets/biometrics.dart';

class SignUpController extends GetxController {
  final String title = 'Sign up Screen';
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController websiteController = TextEditingController();
  final TextEditingController bioController = TextEditingController();

  var count = 0.obs;
  void increment() => count++;
  void username() => Get.snackbar('Your username is', usernameController.text);

  Future<void> biometrics(BuildContext context) async {
    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: Colors.black45,
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (BuildContext buildContext, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return const Biometrics();
        });
  }

  void navigateToSignIn() {
    Get.offNamed<void>(root);
  }
}
