import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:sign_up/src/sign_up_controller.dart';
import 'package:sign_up/src/strings.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 16.01.2023.
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
    Get.lazyPut(() => SignUpController(), fenix: true);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: Get.height * 0.1,
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
                                  Strings.createAccount,
                                  style: Get.theme.textTheme.labelSmall
                                      ?.copyWith(
                                          color: Colors.white,
                                          letterSpacing: 4.0,
                                          fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.center,
                                ),
                              )),
                        ),
                        CustomPaint(
                          size: Size(
                              68.12, (68.12 * 0.5833333333333334).toDouble()),
                          painter: TopCurvedTriangle(Colors.black),
                        ),
                      ]),
                ],
              ),
              Column(
                children: [
                  Container(
                    height: Get.height * 0.65,
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
                    child: Column(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Obx(
                                () => Stack(
                                  alignment: AlignmentDirectional.center,
                                  children: [
                                    controller.image.value == null
                                        ? const CircleAvatar(
                                            backgroundColor: Colors.black,
                                            radius: 50,
                                          )
                                        : CircleAvatar(
                                            radius: 50,
                                            backgroundColor: Colors.black,
                                            backgroundImage: MemoryImage(
                                                controller.image.value!),
                                          ),
                                    InkWell(
                                      onTap: () async {
                                        await controller.selectImage();
                                      },
                                      child: const Icon(
                                        Icons.camera_alt,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              TextFieldInput(
                                backgroundColor: Colors.white,
                                hintText: Strings.username,
                                icon: Icons.person_outline,
                                textInputType: TextInputType.name,
                                textEditingController:
                                    controller.usernameController,
                              ),
                              Card(
                                color: Colors.white,
                                child: Container(
                                  margin: const EdgeInsets.all(8.0),
                                  width: Get.width - 70,
                                  child: InternationalPhoneNumberInput(
                                    countries: const ['KE'],
                                    maxLength: 13,
                                    onInputChanged: (PhoneNumber number) {
                                      controller.phoneNumber = number;
                                    },
                                    onInputValidated: (bool value) {
                                      controller.inputValidated.value = value;
                                    },
                                    ignoreBlank: false,
                                    autoValidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    initialValue: controller.phoneNumber,
                                    cursorColor: Colors.black,
                                    inputDecoration: InputDecoration(
                                        hintText: Strings.phoneNumber,
                                        focusColor: Colors.black,
                                        focusedBorder:
                                            const UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: .3,
                                                    color: Colors.white)),
                                        enabledBorder:
                                            const UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: .0,
                                                    color: Colors.white)),
                                        border: const UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                width: .3,
                                                color: Colors.white))),
                                    textFieldController:
                                        controller.phoneController,
                                    selectorTextStyle: Get
                                        .theme.textTheme.bodyMedium
                                        ?.copyWith(
                                            color: Colors.black,
                                            letterSpacing: 1.0,
                                            height: 2,
                                            fontWeight: FontWeight.w300),
                                    textStyle: Get.theme.textTheme.bodyMedium
                                        ?.copyWith(
                                            color: Colors.black,
                                            letterSpacing: 1.0,
                                            height: 2,
                                            fontWeight: FontWeight.w300),
                                    formatInput: true,
                                    keyboardType:
                                        const TextInputType.numberWithOptions(
                                            signed: true, decimal: true),
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () async {
                                      controller.signInWithGoogle();
                                    },
                                    child: Container(
                                        height: Get.height * 0.06,
                                        width: Get.width / 1.5,
                                        color: Colors.transparent,
                                        child: Container(
                                          decoration: const BoxDecoration(
                                              border: Border(
                                                  top: BorderSide(),
                                                  right: BorderSide(),
                                                  bottom: BorderSide(),
                                                  left: BorderSide()),
                                              color: Colors.black,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(30.0))),
                                          child: Center(
                                            child: Text(
                                              controller.verificationHasPassed
                                                      .value
                                                  ? Strings.verified
                                                  : Strings.getCode,
                                              textAlign: TextAlign.center,
                                              style: Get.textTheme.bodyLarge
                                                  ?.copyWith(
                                                      color: Colors.white,
                                                      height: 0),
                                            ),
                                          ),
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 16.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          Strings.alreadyHaveAnAccount,
                                          style: Get.theme.textTheme.bodyMedium
                                              ?.copyWith(
                                                  color: Colors.black,
                                                  letterSpacing: 1.0,
                                                  height: 0,
                                                  fontWeight: FontWeight.w300),
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        InkWell(
                                          onTap: controller.navigateToLogIn,
                                          child: Text(
                                            Strings.logIn,
                                            style: Get
                                                .theme.textTheme.bodyMedium
                                                ?.copyWith(
                                                    color: Colors.black,
                                                    letterSpacing: 1.0,
                                                    height: 0,
                                                    fontWeight:
                                                        FontWeight.w600),
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
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                CustomPaint(
                  size: Size(68, (68 * 0.8623000000000001).toDouble()),
                  painter: BottomCurvedTriangle(Colors.black),
                ),
                Container(
                    height: Get.height * 0.05,
                    width: Get.width,
                    color: Colors.transparent,
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(30))),
                      child: const SizedBox(),
                    ))
              ]),
            ],
          ),
          Obx(() {
            Widget widget;
            controller.searching.value
                ? widget = Center(
                    child: Card(
                      margin: const EdgeInsets.all(16.0),
                      child: Container(
                        padding: const EdgeInsets.all(4.0),
                        child: RotationTransition(
                          turns: Tween(begin: 0.0, end: 1.0)
                              .animate(controller.animationController),
                          child: GradientCircularProgressIndicator(
                            radius: 16,
                            gradientColors:
                                ThemeService(isDarkMode: Get.isDarkMode)
                                    .strokeColors
                                    .reversed
                                    .toList(),
                            strokeWidth: 3.0,
                          ),
                        ),
                      ),
                    ),
                  )
                : widget = const SizedBox();
            return widget;
          }),
        ],
      ),
    );
  }
}
