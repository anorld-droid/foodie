import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trice/controller/authentication/sign_up_controller.dart';

import 'widgets/curved_traingle.dart';

class SignUp extends GetView<SignUpController> {
  const SignUp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(SignUpController());
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      // Status bar color
      statusBarColor: Colors.black,
      // Status bar brightness (optional)
      statusBarIconBrightness: Brightness.light, // For Android (dark icons)
    ));
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                  height: 68.0,
                  width: Get.width,
                  margin: MediaQuery.of(context).padding,
                  color: Colors.transparent,
                  child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(30))),
                      child: Center(
                        child: Text(
                          "Create Account",
                          style: GoogleFonts.inter(
                              fontStyle: FontStyle.normal,
                              color: Colors.white,
                              fontSize: 20.0,
                              letterSpacing: 4.0,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        ),
                      )),
                ),
                CustomPaint(
                  size: Size(68.12, (68.12 * 0.5833333333333334).toDouble()),
                  painter: TopCurvedTriangle(),
                ),
              ]),
              Column(
                children: [
                  SizedBox(
                    height: 158,
                    width: Get.width,
                  ),
                  Container(
                    height: Get.height - 278,
                    width: Get.width - 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.30),
                            spreadRadius: 0,
                            blurRadius: 10,
                            offset: const Offset(
                                0, 8), // changes position of shadow
                          ),
                        ]),
                    child: Column(
                      children: [],
                    ),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 88,
                    width: Get.width,
                  ),
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        "https://images.unsplash.com/photo-1498050108023-c5249f4df085?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1472&q=80"),
                  ),
                ],
              ),
            ],
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            CustomPaint(
              size: Size(68, (68 * 0.8623000000000001).toDouble()),
              painter: BottomCurvedTriangle(),
            ),
            Container(
              height: 60.0,
              width: Get.width,
              color: Colors.transparent,
              child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(30))),
                  child: const Center(
                    child: Text(
                      "Sign up btn",
                      style: TextStyle(color: Colors.white, fontSize: 22),
                      textAlign: TextAlign.center,
                    ),
                  )),
            ),
          ]),
        ],
      ),
    );
  }
}
