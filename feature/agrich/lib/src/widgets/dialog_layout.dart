import 'package:agrich/src/cuisine_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 09.02.2023.
class DialogLayout extends GetView<CuisineController> {
  final String type;
  final String amount;
  const DialogLayout({Key? key, required this.amount, required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<CuisineController>();
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: SizedBox(
                height: Get.height * 0.25,
                width: Get.width - 24,
                child: Card(
                  color: Get.theme.backgroundColor,
                  surfaceTintColor: Get.theme.backgroundColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8),
                        child: Card(
                          elevation: 0,
                          color: Get.theme.backgroundColor,
                          child: Container(
                            margin: const EdgeInsets.all(8.0),
                            width: Get.width * 0.65,
                            child: InternationalPhoneNumberInput(
                              countries: const ['KE'],
                              maxLength: 13,
                              onInputChanged: (PhoneNumber number) {
                                controller.phoneNumber = number;
                              },
                              onInputValidated: ((value) {
                                controller.inputValidated.value = value;
                              }),
                              ignoreBlank: false,
                              autoValidateMode:
                                  AutovalidateMode.onUserInteraction,
                              initialValue: controller.phoneNumber,
                              cursorColor: Colors.black,
                              inputDecoration: InputDecoration(
                                hintText: 'Phone number',
                                focusColor: Get.theme.backgroundColor,
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    width: .0,
                                    color: Get.theme.backgroundColor,
                                  ),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    width: .0,
                                    color: Get.theme.backgroundColor,
                                  ),
                                ),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    width: .0,
                                    color: Get.theme.backgroundColor,
                                  ),
                                ),
                              ),
                              textFieldController: controller.phoneController,
                              selectorTextStyle: Get.theme.textTheme.bodyMedium
                                  ?.copyWith(
                                      letterSpacing: 1.0,
                                      height: 2,
                                      fontWeight: FontWeight.w300),
                              textStyle: Get.theme.textTheme.bodyMedium
                                  ?.copyWith(
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
                      ),
                      InkWell(
                        onTap: () async {
                          await controller.pay(amount, type);
                        },
                        child: Container(
                            height: Get.height / 22,
                            width: Get.width / 4,
                            color: Colors.transparent,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Get.theme.primaryColorDark,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(30))),
                              child: Center(
                                child: Text(
                                  'Pay',
                                  textAlign: TextAlign.center,
                                  style: Get.textTheme.bodyLarge?.copyWith(
                                      color: Get.theme.backgroundColor),
                                ),
                              ),
                            )),
                      )
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
}
