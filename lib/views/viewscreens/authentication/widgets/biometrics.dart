import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trice/controller/authentication/sign_up_controller.dart';
import 'package:trice/domain/strings.dart';

import 'rounded_corner_btn.dart';

class Biometrics extends GetView<SignUpController> {
  const Biometrics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpController());
    Strings str = Strings();
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
            IconBtn(name: str.regFace, icon: Icons.add),
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
                child: Text(
                  str.faceRecog,
                )),
            const SizedBox(
              height: 30,
            ),
            IconBtn(name: str.addFing, icon: Icons.add),
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
                  str.scanFing,
                )),
          ],
        ),
      ),
    );
  }
}
