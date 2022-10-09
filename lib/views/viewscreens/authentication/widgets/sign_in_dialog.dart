import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trice/controller/authentication/sign_in_controller.dart';
import 'package:trice/domain/strings.dart';
import 'package:trice/views/viewscreens/authentication/widgets/text_field_input.dart';

class SignInDialog extends GetView<SignInController> {
  const SignInDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SignInController());
    Strings str = Strings();
    return Center(
      child: Container(
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
                    decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Center(
                      child: Text(
                        str.contin,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                            fontStyle: FontStyle.normal,
                            color: Colors.white,
                            fontSize: 20.0,
                            letterSpacing: 4.0,
                            fontWeight: FontWeight.w600),
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
