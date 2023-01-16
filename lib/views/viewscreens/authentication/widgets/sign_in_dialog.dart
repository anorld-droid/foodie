import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trice/controller/authentication/sign_in_controller.dart';
import 'package:trice/domain/strings.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 16.01.2023.

class SignInDialog extends GetView<SignInController> {
  const SignInDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SignInController());
    Strings str = Strings();
    return Center(
      child: SizedBox(
        height: Get.height / 5,
        width: Get.width - 24,
        child: Card(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            TextFieldInput(
              textEditingController: controller.usernameController,
              textInputType: TextInputType.name,
              hintText: str.enterusername,
              icon: Icons.person_outline_outlined,
            ),
            const SizedBox(
              height: 24,
            ),
            InkWell(
              onTap: controller.getUserDetails,
              child: Container(
                  height: Get.height / 22,
                  width: Get.width / 3,
                  color: Colors.transparent,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Get.theme.primaryColorDark,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30))),
                    child: Center(
                      child: Text(
                        str.contin,
                        textAlign: TextAlign.center,
                        style: Get.textTheme.headlineSmall
                            ?.copyWith(color: Get.theme.backgroundColor),
                      ),
                    ),
                  )),
            )
          ]),
        ),
      ),
    );
  }
}
