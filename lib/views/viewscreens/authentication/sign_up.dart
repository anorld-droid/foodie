import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trice/controller/authentication/sign_up_controller.dart';
import 'package:slider_button/slider_button.dart';
import 'widgets/curved_traingle.dart';
import 'widgets/text_field_input.dart';

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
                  height: 80.0,
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
                    height: 180,
                    width: Get.width,
                  ),
                  Container(
                    height: Get.height - 367,
                    width: Get.width - 20,
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
                            hintText: "Username",
                            icon: Icons.person_outline,
                            textInputType: TextInputType.name,
                            textEditingController:
                                controller.usernameController,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFieldInput(
                            hintText: "Phone Number",
                            icon: Icons.phone,
                            textInputType: TextInputType.phone,
                            textEditingController: controller.phoneController,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFieldInput(
                            hintText: "Email",
                            icon: Icons.alternate_email_outlined,
                            textInputType: TextInputType.emailAddress,
                            textEditingController: controller.emailController,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFieldInput(
                            hintText: "Social Media handle",
                            icon: Icons.link,
                            textInputType: TextInputType.url,
                            textEditingController: controller.websiteController,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFieldInput(
                            hintText: "Bio",
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
                              width: Get.width - 180,
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
                                "Register your Biometrics",
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
                          Container(
                            width: Get.width - 160,
                            child: Row(
                              children: [
                                Text(
                                  "ALready have an account?",
                                  style: GoogleFonts.inter(
                                      fontStyle: FontStyle.normal,
                                      color: Colors.black,
                                      fontSize: 18.0,
                                      letterSpacing: 1.0,
                                      fontWeight: FontWeight.w300),
                                  textAlign: TextAlign.center,
                                ),
                                InkWell(
                                  onTap: (() {}),
                                  child: Text(
                                    "Log in",
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
              height: 68.0,
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
                            action: () {},
                            label: Text(
                              "Slide to sign up",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                                  fontStyle: FontStyle.normal,
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  letterSpacing: 1.0,
                                  fontWeight: FontWeight.w600),
                            ),
                            icon: Icon(Icons.chevron_right_outlined)),
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
