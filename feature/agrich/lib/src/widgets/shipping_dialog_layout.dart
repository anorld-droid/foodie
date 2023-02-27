import 'package:agrich/src/cuisine_controller.dart';
import 'package:common/common.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 19.01.2023.
class ShippingDialogLayout extends GetView<CuisineController> {
  const ShippingDialogLayout({Key? key}) : super(key: key);

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
                height: Get.height * 0.7,
                width: Get.width - 24,
                child: Card(
                  color: Get.theme.backgroundColor,
                  surfaceTintColor: Get.theme.backgroundColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0, left: 16.0),
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
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: SizedBox(
                          width: Get.width * 0.74,
                          child: DropdownSearch<String>(
                            popupProps: const PopupProps.menu(
                              menuProps: MenuProps(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                              ),
                              showSelectedItems: true,
                            ),
                            items: controller
                                .destinations.value.destinations.keys
                                .toList(),
                            dropdownDecoratorProps: DropDownDecoratorProps(
                              dropdownSearchDecoration: InputDecoration(
                                labelText: 'County',
                                hintText: 'County',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide.none),
                                fillColor: Get.theme.backgroundColor,
                                focusColor: Get.theme.backgroundColor,
                                filled: true,
                              ),
                            ),
                            dropdownButtonProps: DropdownButtonProps(
                                color: Get.theme.primaryColorDark),
                            onChanged: (value) {
                              controller.county.value = value ?? '';
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: SizedBox(
                          width: Get.width * 0.74,
                          child: Obx(
                            () => DropdownSearch<String>(
                              popupProps: const PopupProps.menu(
                                menuProps: MenuProps(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                ),
                                showSelectedItems: true,
                              ),
                              items: controller.destinations.value
                                      .destinations[controller.county.value] ??
                                  [],
                              dropdownDecoratorProps: DropDownDecoratorProps(
                                dropdownSearchDecoration: InputDecoration(
                                  labelText: 'Town',
                                  hintText: 'Town',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide.none),
                                  fillColor: Get.theme.backgroundColor,
                                  focusColor: Get.theme.backgroundColor,
                                  filled: true,
                                ),
                              ),
                              dropdownButtonProps: DropdownButtonProps(
                                  color: Get.theme.primaryColorDark),
                              onChanged: (value) {
                                controller.town.value = value ?? '';
                              },
                            ),
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
          ],
        ),
      ),
    );
  }
}
