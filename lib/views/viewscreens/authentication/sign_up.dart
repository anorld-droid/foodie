import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trice/controller/authentication/sign_up_controller.dart';
import 'package:slider_button/slider_button.dart';
import 'package:trice/domain/strings.dart';
import 'widgets/curved_traingle.dart';
import 'widgets/text_field_input.dart';

class SignUp extends GetView<SignUpController> {
  const SignUp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      // Status bar color
      statusBarColor: Colors.black,
      // Status bar brightness (optional)
      statusBarIconBrightness: Brightness.light, // For Android (dark icons)
    ));
    Strings str = Strings();
    Get.put(SignUpController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                  height: Get.height * 1 / 12,
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
                          str.createAccount,
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
                  painter: TopCurvedTriangle(Colors.black),
                ),
              ]),
              Column(
                children: [
                  SizedBox(
                    height: 180,
                    width: Get.width,
                  ),
                  Container(
                    height: Get.height * 1 / 1.7,
                    width: Get.width * 1 / 1.05,
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
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(
                            height: 37,
                          ),
                          TextFieldInput(
                            hintText: str.username,
                            icon: Icons.person_outline,
                            textInputType: TextInputType.name,
                            textEditingController:
                                controller.usernameController,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFieldInput(
                            hintText: str.phoneNumber,
                            icon: Icons.phone,
                            textInputType: TextInputType.phone,
                            textEditingController: controller.phoneController,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFieldInput(
                            hintText: str.email,
                            icon: Icons.alternate_email_outlined,
                            textInputType: TextInputType.emailAddress,
                            textEditingController: controller.emailController,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFieldInput(
                            hintText: str.website,
                            icon: Icons.link,
                            textInputType: TextInputType.url,
                            textEditingController: controller.websiteController,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFieldInput(
                            hintText: str.bio,
                            icon: Icons.library_books_outlined,
                            textInputType: TextInputType.text,
                            textEditingController: controller.bioController,
                          ),
                          const SizedBox(
                            height: 60,
                          ),
                          InkWell(
                            onTap: (() => controller.biometrics(context)),
                            child: Container(
                              width: Get.width * 1 / 1.779,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                  border: Border(
                                      top: BorderSide(
                                        color: Colors.black,
                                      ),
                                      bottom: BorderSide(
                                        color: Colors.black,
                                      ),
                                      right: BorderSide(
                                        color: Colors.black,
                                      ),
                                      left: BorderSide(
                                        color: Colors.black,
                                      ))),
                              child: Text(
                                str.biometrics,
                                style: GoogleFonts.inter(
                                    fontStyle: FontStyle.normal,
                                    color: Colors.black,
                                    fontSize: 18.0,
                                    letterSpacing: 1.0,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: Get.width / 1.6375,
                            child: Row(
                              children: [
                                Text(
                                  str.alreadyHaveAnAccount,
                                  style: GoogleFonts.inter(
                                      fontStyle: FontStyle.normal,
                                      color: Colors.black,
                                      fontSize: 18.0,
                                      letterSpacing: 1.0,
                                      fontWeight: FontWeight.w300),
                                  textAlign: TextAlign.center,
                                ),
                                InkWell(
                                  onTap: controller.navigateToSignIn,
                                  child: Text(
                                    str.logIn,
                                    style: GoogleFonts.inter(
                                        fontStyle: FontStyle.normal,
                                        color: Colors.black,
                                        fontSize: 18.0,
                                        letterSpacing: 1.0,
                                        fontWeight: FontWeight.w600),
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 60,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 130,
                    width: Get.width,
                  ),
                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      const CircleAvatar(
                        backgroundColor: Colors.black12,
                        radius: 50,
                        backgroundImage: NetworkImage(""),
                      ),
                      InkWell(
                        onTap: controller.increment,
                        child: const Icon(
                          Icons.camera_alt,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            CustomPaint(
              size: Size(68, (68 * 0.8623000000000001).toDouble()),
              painter: BottomCurvedTriangle(Colors.black),
            ),
            Container(
              height: Get.height * 1 / 13,
              width: Get.width,
              color: Colors.transparent,
              child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(30))),
                  child: Column(
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
                            vibrationFlag: true,
                            action: controller.navigateToSignIn,
                            label: Text(
                              str.slideSignUp,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                                  fontStyle: FontStyle.normal,
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  letterSpacing: 1.0,
                                  fontWeight: FontWeight.w600),
                            ),
                            icon: const Icon(Icons.chevron_right_outlined)),
                      ),
                    ],
                  )),
            ),
          ]),
        ],
      ),
    );
  }
}
