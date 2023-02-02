import 'package:cart/src/controller.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 19.01.2023.
class DialogLayout extends GetView<Controller> {
  const DialogLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<Controller>();
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: SizedBox(
                height: Get.height * 0.7,
                width: Get.width - 24,
                child: Card(
                  color: Get.theme.backgroundColor,
                  surfaceTintColor: Get.theme.backgroundColor,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8),
                          child: CustomTextField(
                            textEditingController: controller.nameController,
                            textInputType: TextInputType.name,
                            borderRadius: 8,
                            height: 48,
                            hintText: 'Full Name (Legal)',
                            labelText: 'Full Name',
                            backgroundColor: Get.theme.backgroundColor,
                          ),
                        ),
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
                                onInputValidated: (bool value) {
                                  controller.inputValidated.value = value;
                                },
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
                                selectorTextStyle:
                                    Get.theme.textTheme.bodyMedium?.copyWith(
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
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8),
                          child: CustomTextField(
                            textEditingController:
                                controller.buildingController,
                            textInputType: TextInputType.name,
                            borderRadius: 8,
                            height: 48,
                            hintText: 'Building or Street name',
                            labelText: 'Building',
                            backgroundColor: Get.theme.backgroundColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8),
                          child: CustomTextField(
                            textEditingController: controller.floorController,
                            textInputType: TextInputType.number,
                            borderRadius: 8,
                            height: 48,
                            hintText: 'Floor No (ie. 2)',
                            labelText: 'Floor No',
                            backgroundColor: Get.theme.backgroundColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8),
                          child: CustomTextField(
                            textEditingController: controller.roomController,
                            textInputType: TextInputType.name,
                            borderRadius: 8,
                            height: 48,
                            hintText: 'Room No (ie. G75) ',
                            labelText: 'Room No',
                            backgroundColor: Get.theme.backgroundColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8),
                          child: CustomTextField(
                            textEditingController:
                                controller.landmarkController,
                            textInputType: TextInputType.name,
                            borderRadius: 8,
                            height: 48,
                            hintText:
                                'Landmark(ie. Around the airport, kisumu boys..)',
                            labelText: 'Landmark',
                            backgroundColor: Get.theme.backgroundColor,
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
                                    'Save',
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
            ),
          ],
        ),
      ),
    );
  }
}
