import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trice/controller/authentication/sign_up_controller.dart';

import 'rounded_corner_btn.dart';

class Biometrics extends GetView<SignUpController> {
  const Biometrics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpController());
    return Center(
      child: Container(
        width: Get.width * 1 / 1.0249,
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
                child: const Text(
                  "Scan your fingerprint",
                )),
          ],
        ),
      ),
    );
  }
}
