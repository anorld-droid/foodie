import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:log_in/src/strings.dart';

import 'log_in_controller.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 16.01.2023.
class LogIn extends GetView<LogInController> {
  const LogIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      // Status bar color
      statusBarColor: Colors.white,
      // Status bar brightness (optional)
      statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
    ));
    Get.lazyPut<LogInController>(() => LogInController(), fenix: true);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: Get.height / 13,
                          width: Get.width,
                          alignment: AlignmentDirectional.bottomStart,
                          margin: MediaQuery.of(context).padding,
                          color: Colors.transparent,
                          child: Container(
                              alignment: AlignmentDirectional.bottomStart,
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(30))),
                              child: Row(
                                children: [
                                  const SizedBox(
                                    height: 40,
                                    width: 17,
                                  ),
                                  Text(
                                    Strings.logIn,
                                    style: GoogleFonts.inter(
                                        fontStyle: FontStyle.normal,
                                        color: Colors.black,
                                        fontSize: 24.0,
                                        height: 0,
                                        letterSpacing: 2.0,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              )),
                        ),
                        CustomPaint(
                          size: Size(
                              68.12, (68.12 * 0.5833333333333334).toDouble()),
                          painter: TopCurvedTriangle(Colors.white),
                        ),
                      ]),
                  Column(children: [
                    SizedBox(
                      height: 160,
                      width: Get.width,
                    ),
                    Container(
                      height: Get.height / 1.44,
                      width: Get.width / 1.05,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: Colors.black,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white.withOpacity(0.25),
                              spreadRadius: 0,
                              blurRadius: 10,
                              offset: const Offset(
                                  2, 2), // changes position of shadow
                            ),
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const SizedBox(
                                height: 24,
                              ),
                              Text(
                                Strings.welcome,
                                style: GoogleFonts.inter(
                                    fontStyle: FontStyle.normal,
                                    color: Colors.white,
                                    fontSize: 28.0,
                                    height: 0,
                                    letterSpacing: 6.0,
                                    fontWeight: FontWeight.w200),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Obx((() => (Text(
                                    controller.username.value,
                                    style: GoogleFonts.inter(
                                        fontStyle: FontStyle.normal,
                                        color: Colors.white,
                                        fontSize: 28.0,
                                        height: 0,
                                        letterSpacing: .2,
                                        fontWeight: FontWeight.w300),
                                  )))),
                            ],
                          ),
                          Center(
                            child: Column(
                              children: [
                                IconButton(
                                  onPressed: controller.fingerprintAuth,
                                  icon: Obx(() => Icon(
                                        Icons.fingerprint_outlined,
                                        color: Colors.white.withOpacity(
                                            controller.authenticated.value
                                                ? 1
                                                : 0.8),
                                        size: 100,
                                      )),
                                  iconSize: 100,
                                ),
                                Text(Strings.logInPrompt,
                                    style: GoogleFonts.inter(
                                        fontStyle: FontStyle.normal,
                                        color: Colors.white,
                                        fontSize: 20.0,
                                        height: 0,
                                        fontWeight: FontWeight.w200))
                              ],
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  height: 43,
                                  width: 305,
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(100)),
                                      gradient: LinearGradient(
                                        colors: [
                                          // Color(0xFF000000),
                                          Color(0xFF000000),
                                          Color(0xFF434343),
                                          Color.fromARGB(255, 97, 95, 95),
                                          Color.fromARGB(255, 97, 95, 95),
                                          Color.fromARGB(255, 155, 150, 150),
                                        ],
                                      )),
                                  child: CustomSliderButton(
                                      action: () =>
                                          controller.logInDialog(context),
                                      actionName:
                                          Strings.signToAnotherAccount)),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                width: Get.width / 1.6375,
                                child: Row(
                                  children: [
                                    Text(
                                      Strings.dontHaveAccount,
                                      style: GoogleFonts.inter(
                                          fontStyle: FontStyle.normal,
                                          color: Colors.white,
                                          fontSize: 18.0,
                                          height: 0,
                                          letterSpacing: 1.0,
                                          fontWeight: FontWeight.w400),
                                      textAlign: TextAlign.center,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 4.0),
                                      child: InkWell(
                                        onTap: controller.navigateToSignup,
                                        child: Text(
                                          Strings.signup,
                                          style: GoogleFonts.inter(
                                              fontStyle: FontStyle.normal,
                                              color: Colors.white,
                                              fontSize: 18.0,
                                              height: 0,
                                              letterSpacing: 1.0,
                                              fontWeight: FontWeight.w600),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ]),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 69,
                        width: Get.width,
                      ),
                      Obx(
                        () => Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            controller.profilePic.value.isNotEmpty
                                ? CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 65,
                                    backgroundImage: NetworkImage(
                                        controller.profilePic.value),
                                  )
                                : const CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 65,
                                  )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                CustomPaint(
                  size: Size(68, (68 * 0.8623000000000001).toDouble()),
                  painter: BottomCurvedTriangle(Colors.white),
                ),
                Container(
                    height: Get.height / 11.4,
                    width: Get.width,
                    color: Colors.transparent,
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(30))),
                    ))
              ])
            ]),
      ),
    );
  }
}
