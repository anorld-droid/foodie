import 'package:common/common.dart';
import 'package:common/src/controller/controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 16.01.2023.
class AuthDialog extends GetView<CommonController> {
  const AuthDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<CommonController>();
    return SizedBox(
      height: Get.height * 0.75,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: Get.height * 0.1),
              child: SizedBox(
                height: Get.height * 0.48,
                width: Get.width * 0.8,
                child: Container(
                  decoration: BoxDecoration(
                    color: Get.theme.colorScheme.background,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: TabBarView(
                    controller: controller.tabController,
                    children: [
                      _tabViewLayout(true),
                      _tabViewLayout(false),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: Get.height * 0.06),
              child: SizedBox(
                width: Get.width * 0.8,
                child: Card(
                  color: Get.theme.colorScheme.tertiary,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  shadowColor: Get.theme.primaryColorDark.withOpacity(.35),
                  child: TabBar(
                    indicatorColor: Get.theme.colorScheme.onBackground,
                    unselectedLabelColor: Get.theme.colorScheme.onPrimary,
                    unselectedLabelStyle: Get.textTheme.bodySmall,
                    labelColor: Get.theme.colorScheme.tertiary,
                    labelStyle: Get.textTheme.bodySmall,
                    dividerColor: Get.theme.colorScheme.surface,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Get.theme.colorScheme.onPrimary,
                    ),
                    controller: controller.tabController,
                    tabs: const [
                      Tab(
                        text: 'Log in',
                      ),
                      Tab(
                        text: 'Create Account',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tabViewLayout(bool isLogIn) {
    return SizedBox(
      height: Get.height * 0.25,
      child: Card(
        elevation: 0,
        color: Get.theme.colorScheme.background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                isLogIn ? CommonStrings.loginSal : CommonStrings.logoutSal,
                style: Get.textTheme.headlineLarge,
                textAlign: TextAlign.start,
              ),
              if (isLogIn)
                Text(
                  CommonStrings.welcome,
                  style: Get.textTheme.headlineSmall
                      ?.copyWith(fontWeight: FontWeight.w100),
                  textAlign: TextAlign.start,
                ),
              if (isLogIn)
                Text(
                  CommonStrings.greetings,
                  style: Get.textTheme.headlineSmall
                      ?.copyWith(fontWeight: FontWeight.w100),
                  textAlign: TextAlign.start,
                ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 24.0, bottom: 16.0, left: 14.0, right: 14.0),
                child: TextFieldInput(
                  borderRadius: 8,
                  backgroundColor: Get.theme.colorScheme.surface,
                  hintText: CommonStrings.email,
                  textInputType: TextInputType.emailAddress,
                  textEditingController: controller.emailController,
                  textColor: Get.theme.colorScheme.onBackground,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 24.0, left: 14.0, right: 14.0),
                child: TextFieldInput(
                  borderRadius: 8,
                  backgroundColor: Get.theme.colorScheme.surface,
                  hintText: CommonStrings.password,
                  isPass: true,
                  textInputType: TextInputType.visiblePassword,
                  textEditingController: controller.passwordController,
                  textColor: Get.theme.colorScheme.onBackground,
                ),
              ),
              if (!isLogIn)
                Padding(
                  padding:
                      const EdgeInsets.only(top: 32, left: 16.0, right: 16.0),
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: 'By continuing, you agree to our ',
                        style: Get.textTheme.bodyLarge,
                      ),
                      TextSpan(
                        text: 'Terms of Service',
                        style: Get.textTheme.bodySmall
                            ?.copyWith(color: Colors.blue),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                      TextSpan(
                        text: ' and that you have read our ',
                        style: Get.textTheme.bodyLarge,
                      ),
                      TextSpan(
                          text: 'Privacy Policy',
                          style: Get.textTheme.bodySmall
                              ?.copyWith(color: Colors.blue),
                          recognizer: TapGestureRecognizer()..onTap = () {}),
                    ]),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.only(top: 48.0),
                child: Center(
                  child: InkWell(
                    onTap:
                        isLogIn ? controller.sigIn : controller.createAccount,
                    child: Container(
                        height: 40,
                        width: 120,
                        color: Get.theme.colorScheme.primaryContainer,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Get.theme.colorScheme.primary,
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(12.0))),
                          child: Center(
                            child: Text(
                              isLogIn
                                  ? CommonStrings.logIn
                                  : CommonStrings.signup,
                              textAlign: TextAlign.center,
                              style: Get.textTheme.bodySmall?.copyWith(
                                color: Get.theme.colorScheme.background,
                              ),
                            ),
                          ),
                        )),
                  ),
                ),
              )
            ]),
            Obx(() {
              Widget widget;
              controller.searching.value
                  ? widget = Center(
                      child: Material(
                        color: Get.theme.colorScheme.primaryContainer,
                        surfaceTintColor:
                            Get.theme.colorScheme.primaryContainer,
                        child: Container(
                          color: Get.theme.colorScheme.primaryContainer,
                          padding: const EdgeInsets.all(4.0),
                          child: RotationTransition(
                            turns: Tween(begin: 0.0, end: 1.0)
                                .animate(controller.animationController),
                            child: GradientCircularProgressIndicator(
                              radius: 20,
                              gradientColors: [
                                Get.theme.colorScheme.primary.withAlpha(170),
                                Get.theme.colorScheme.primary,
                              ],
                              strokeWidth: 5.0,
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
    );
  }
}
