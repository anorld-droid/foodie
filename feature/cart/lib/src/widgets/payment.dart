import 'package:cart/src/controller.dart';
import 'package:cart/src/utils/strings.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Payment extends GetView<Controller> {
  const Payment({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Get.theme.colorScheme.background,
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(
              width: 1.0,
              color: Get.theme.colorScheme.background.withOpacity(0.05),
            ),
          ),
          margin: const EdgeInsets.only(
              top: 32.0, left: 32.0, right: 32.0, bottom: 8.0),
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Strings.total,
                style: Get.textTheme.bodyLarge?.copyWith(
                    // color: Get.theme.colorScheme.background,
                    ),
              ),
              const SizedBox(
                width: 8.0,
              ),
              Obx(
                () => RichText(
                  text: TextSpan(
                    text: '',
                    children: [
                      WidgetSpan(
                        child: Transform.translate(
                            offset: const Offset(-2, -8),
                            child: Text(
                              CommonStrings.currency.toLowerCase(),
                              style: Get.textTheme.bodySmall?.copyWith(
                                fontWeight: FontWeight.bold,
                                textBaseline: TextBaseline.alphabetic,
                                // color: Get.theme.colorScheme.background,
                              ),
                            )),
                      ),
                      TextSpan(
                        text: controller.total.value.toStringAsFixed(2),
                        style: Get.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          // color: Get.theme.colorScheme.background,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Get.theme.colorScheme.onBackground.withAlpha(20),
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(
              width: 1.0,
              color: Get.theme.colorScheme.background.withOpacity(0.05),
            ),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Payment method',
                    style: Get.textTheme.bodyLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: 36.0,
                    decoration: BoxDecoration(
                      color: Get.theme.colorScheme.onBackground,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Obx(
                      () => DropdownButton<String>(
                        value: controller.selectedOption.value,
                        items: <String>[
                          'M-pesa',
                          'Airtel Money',
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                            ),
                          );
                        }).toList(),
                        style: Get.textTheme.bodySmall
                            ?.copyWith(color: Get.theme.colorScheme.background),
                        onChanged: (String? newValue) {
                          controller.selectedOption.value = newValue ?? '';
                        },
                        underline: Container(
                          height: 0,
                          color: Get.theme.colorScheme.primaryContainer,
                        ),
                        dropdownColor: Get.theme.colorScheme.onBackground,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 12.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Get.theme.colorScheme.onBackground,
                        borderRadius: BorderRadius.circular(8.0)),
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    padding: const EdgeInsets.all(14.0),
                    child: Text(
                      '+254',
                      style: Get.textTheme.bodyLarge
                          ?.copyWith(color: Get.theme.colorScheme.background),
                    ),
                  ),
                  _paymentTextField()
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _paymentTextField() {
    return SizedBox(
      height: 50,
      width: Get.width * 0.56,
      child: Center(
        child: TextField(
          style: Get.textTheme.bodyLarge
              ?.copyWith(color: Get.theme.colorScheme.background),
          keyboardType: TextInputType.phone,
          cursorColor: Get.theme.colorScheme.background,

          // scrollPadding: const EdgeInsets.all(40),
          controller: controller.phoneController,
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none),
            fillColor: Get.theme.colorScheme.onBackground,
            focusColor: Get.theme.colorScheme.onBackground,
            filled: true,
            hintText: 'Enter mobile number',
            hintStyle: Get.textTheme.bodySmall
                ?.copyWith(color: Get.theme.colorScheme.background),
          ),
        ),
      ),
    );
  }
}
