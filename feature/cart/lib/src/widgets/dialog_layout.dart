import 'package:cart/src/controller.dart';
import 'package:cart/src/utils/strings.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 19.01.2023.
class DialogLayout extends GetView<CartController> {
  const DialogLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Get.theme.colorScheme.primaryContainer,
      height: Get.height * 0.40,
      child: Material(
        color: Get.theme.colorScheme.background,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 24.0),
                child: TextFieldInput(
                  textEditingController: controller.nameController,
                  textInputType: TextInputType.name,
                  borderRadius: 8,
                  height: 48,
                  hintText: 'Full Name (Legal)',
                  backgroundColor: Get.theme.colorScheme.surface,
                  textColor: Get.theme.colorScheme.onBackground,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
                child: Card(
                  elevation: 0,
                  color: Get.theme.colorScheme.surface,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 12.0),
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
                      cursorColor: Get.theme.colorScheme.onBackground,
                      inputDecoration: InputDecoration(
                        hintText: Strings.phoneNumber,
                        hintStyle: Get.textTheme.displayMedium?.copyWith(
                          color: Get.theme.colorScheme.onBackground,
                        ),
                        focusColor: Get.theme.colorScheme.onBackground,
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            width: .0,
                            color: Get.theme.colorScheme.background,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            width: .0,
                            color: Get.theme.colorScheme.background,
                          ),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            width: .0,
                            color: Get.theme.colorScheme.background,
                          ),
                        ),
                      ),
                      textFieldController: controller.phoneController,
                      selectorTextStyle:
                          Get.theme.textTheme.bodyMedium?.copyWith(
                        color: Get.theme.colorScheme.onBackground,
                      ),
                      textStyle: Get.theme.textTheme.bodyMedium?.copyWith(
                        color: Get.theme.colorScheme.onBackground,
                      ),
                      formatInput: true,
                      keyboardType: const TextInputType.numberWithOptions(
                          signed: true, decimal: true),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 24.0),
                child: TextFieldInput(
                  textEditingController: controller.buildingController,
                  textInputType: TextInputType.name,
                  borderRadius: 8,
                  height: 48,
                  hintText: Strings.buildingHint,
                  backgroundColor: Get.theme.colorScheme.surface,
                  textColor: Get.theme.colorScheme.onBackground,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Text(
                    Strings.locNotification,
                    style: Get.textTheme.bodySmall,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () async {
                  await controller.saveShippingInfo();
                },
                child: Container(
                  height: 48,
                  width: 120,
                  decoration: BoxDecoration(
                      color: Get.theme.colorScheme.primary,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(12))),
                  child: Center(
                    child: Text(
                      Strings.save,
                      textAlign: TextAlign.center,
                      style: Get.textTheme.bodyLarge
                          ?.copyWith(color: Get.theme.colorScheme.onPrimary),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
