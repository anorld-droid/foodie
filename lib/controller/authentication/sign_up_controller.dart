import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../views/viewscreens/authentication/widgets/rounded_corner_btn.dart';

class SignUpController extends GetxController {
  final String title = 'Sign up Screen';
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController websiteController = TextEditingController();
  final TextEditingController bioController = TextEditingController();

  var count = 0.obs;
  increment() => count++;
  username() => Get.snackbar("Your username is", usernameController.text);

  Future<void> biometrics(BuildContext context) async {
    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: Colors.black45,
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (BuildContext buildContext, Animation animation,
            Animation secondaryAnimation) {
          return Center(
            child: Container(
              width: Get.width - 10,
              height: 480,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const IconBtn(name: "Register face", icon: Icons.add),
                  const SizedBox(
                    height: 20,
                  ),
                  const Icon(
                    Icons.sentiment_satisfied_sharp,
                    color: Colors.black,
                    size: 100,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  DefaultTextStyle(
                      style: GoogleFonts.inter(
                          fontStyle: FontStyle.normal,
                          color: Colors.black,
                          fontSize: 28.0,
                          fontWeight: FontWeight.w700),
                      child: const Text(
                        "Face Recognition",
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  const IconBtn(name: "Add fingerprint", icon: Icons.add),
                  const SizedBox(
                    height: 20,
                  ),
                  const Icon(
                    Icons.fingerprint_outlined,
                    color: Colors.black,
                    size: 100,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  DefaultTextStyle(
                      style: GoogleFonts.inter(
                          fontStyle: FontStyle.normal,
                          color: Colors.black,
                          fontSize: 28.0,
                          fontWeight: FontWeight.w700),
                      child: Text(
                        "Scan your fingerprint",
                      )),
                ],
              ),
            ),
          );
        });
  }
}
