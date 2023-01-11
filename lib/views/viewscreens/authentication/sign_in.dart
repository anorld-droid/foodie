import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slider_button/slider_button.dart';
import 'package:trice/controller/authentication/sign_in_controller.dart';
import 'package:trice/domain/strings.dart';
import 'package:trice/views/viewscreens/authentication/widgets/curved_traingle.dart';

class SignIn extends GetView<SignInController> {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      // Status bar color
      statusBarColor: Colors.white,
      // Status bar brightness (optional)
      statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
    ));
    Get.put(SignInController());
    Strings str = Strings();
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
                                    str.logIn,
                                    style: GoogleFonts.inter(
                                        fontStyle: FontStyle.normal,
                                        color: Colors.black,
                                        fontSize: 24.0,
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
                            children: [
                              const SizedBox(
                                height: 24,
                              ),
                              Text(
                                str.welcome,
                                style: GoogleFonts.inter(
                                    fontStyle: FontStyle.normal,
                                    color: Colors.white,
                                    fontSize: 28.0,
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
                                        letterSpacing: .2,
                                        fontWeight: FontWeight.w300),
                                  )))),
                            ],
                          ),
                          Center(
                            child: Icon(
                              Icons.fingerprint_outlined,
                              color: Colors.white.withOpacity(0.5),
                              size: 100,
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              DefaultTextStyle(
                                  style: GoogleFonts.inter(
                                      fontStyle: FontStyle.normal,
                                      color: Colors.white.withOpacity(0.7),
                                      fontSize: 40.0,
                                      fontWeight: FontWeight.w700),
                                  child: Text(
                                    str.scanFing,
                                  )),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 43,
                                width: 305,
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(100)),
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
                                child: SliderButton(
                                    height: 40,
                                    width: 302,
                                    buttonSize: 32,
                                    baseColor: Colors.white,
                                    alignLabel: Alignment.center,
                                    backgroundColor: Colors.black,
                                    highlightedColor: Colors.black,
                                    action: () =>
                                        controller.navigateToNewsRoom(),
                                    label: Text(
                                      str.changeUsername,
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.inter(
                                          fontStyle: FontStyle.normal,
                                          color: Colors.white,
                                          fontSize: 18.0,
                                          letterSpacing: 1.0,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    icon: const Icon(
                                        Icons.chevron_right_outlined)),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                width: Get.width / 1.6375,
                                child: Row(
                                  children: [
                                    Text(
                                      str.dontHaveAccount,
                                      style: GoogleFonts.inter(
                                          fontStyle: FontStyle.normal,
                                          color: Colors.white,
                                          fontSize: 18.0,
                                          letterSpacing: 1.0,
                                          fontWeight: FontWeight.w400),
                                      textAlign: TextAlign.center,
                                    ),
                                    InkWell(
                                      onTap: controller.navigateToSignup,
                                      child: Text(
                                        str.signup,
                                        style: GoogleFonts.inter(
                                            fontStyle: FontStyle.normal,
                                            color: Colors.white,
                                            fontSize: 18.0,
                                            letterSpacing: 1.0,
                                            fontWeight: FontWeight.w600),
                                        textAlign: TextAlign.center,
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
                      Stack(
                        alignment: AlignmentDirectional.center,
                        children: const [
                          CircleAvatar(
                            backgroundColor: Colors.white38,
                            radius: 65,
                            backgroundImage: NetworkImage(
                                "https://images.unsplash.com/photo-1564166174574-a9666f590437?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"),
                          ),
                        ],
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
