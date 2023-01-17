import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../log_in_controller.dart';
import '../strings.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 16.01.2023.
class LogInDialog extends GetView<LogInController> {
  const LogInDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<LogInController>();
    return Center(
      child: SizedBox(
        height: Get.height / 4.8,
        width: Get.width - 24,
        child: Card(
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                SizedBox(
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
                    autoValidateMode: AutovalidateMode.onUserInteraction,
                    initialValue: controller.phoneNumber,
                    cursorColor: Colors.black,
                    inputDecoration: InputDecoration(
                        hintText: Strings.phoneNumber,
                        focusColor: Colors.black,
                        focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(width: .3, color: Colors.black)),
                        border: const UnderlineInputBorder(
                            borderSide:
                                BorderSide(width: .3, color: Colors.black))),
                    textFieldController: controller.phoneNumberController,
                    textStyle: Get.theme.textTheme.bodyMedium?.copyWith(
                        color: Colors.black,
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.w300),
                    formatInput: true,
                    keyboardType: const TextInputType.numberWithOptions(
                        signed: true, decimal: true),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                Obx(() => InkWell(
                      onTap: controller.verifyNumber,
                      child: Container(
                          height: Get.height / 22,
                          width: Get.width / 4,
                          color: Colors.transparent,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Get.theme.primaryColorDark,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(30))),
                            child: Center(
                              child: Text(
                                controller.verificationHasPassed.value
                                    ? Strings.verified
                                    : Strings.getCode,
                                textAlign: TextAlign.center,
                                style: Get.textTheme.labelSmall
                                    ?.copyWith(color: Get.theme.backgroundColor),
                              ),
                            ),
                          )),
                    ))
              ]),
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
                          gradientColors: ThemeService(isDarkMode: Get.isDarkMode)
                              .strokeColors
                              .reversed
                              .toList(),
                          strokeWidth: 3.0,
                        ),
                      ),
                    ),
                  ),
                )
                    : widget = const  SizedBox();
                return widget;
              }),
            ],
          ),
        ),
      ),
    );
  }
}
