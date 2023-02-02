import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:log_in/src/log_in_controller.dart';
import 'package:log_in/src/strings.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 16.01.2023.
class LogInDialog extends GetView<LogInController> {
  const LogInDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<LogInController>();
    return Center(
      child: SizedBox(
        height: Get.height * 0.25,
        width: Get.width - 24,
        child: Card(
          color: Colors.white,
          surfaceTintColor: Colors.white,
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextFieldInput(
                      backgroundColor: Colors.white,
                      hintText: Strings.email,
                      icon: Icons.email_outlined,
                      textInputType: TextInputType.emailAddress,
                      textEditingController: controller.emailController,
                      textStyle: Get.textTheme.bodyLarge
                          ?.copyWith(color: Colors.black),
                    ),
                    TextFieldInput(
                      backgroundColor: Colors.white,
                      hintText: Strings.password,
                      icon: Icons.password_outlined,
                      isPass: true,
                      textInputType: TextInputType.visiblePassword,
                      textEditingController: controller.passwordController,
                      textStyle: Get.textTheme.bodyLarge
                          ?.copyWith(color: Colors.black),
                    ),
                    InkWell(
                      onTap: controller.sigIn,
                      child: Container(
                          height: Get.height / 22,
                          width: Get.width / 4,
                          color: Colors.transparent,
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Colors.black,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            child: Center(
                              child: Text(
                                Strings.logIn,
                                textAlign: TextAlign.center,
                                style: Get.textTheme.bodySmall
                                    ?.copyWith(color: Colors.white, height: 0),
                              ),
                            ),
                          )),
                    )
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
        ),
      ),
    );
  }
}
