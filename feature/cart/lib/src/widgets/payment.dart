import 'package:cart/src/controller.dart';
import 'package:cart/src/utils/strings.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Payment extends GetView<CartController> {
  const Payment({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.37,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color.fromARGB(255, 5, 52, 49),
            const Color.fromARGB(181, 5, 52, 49),
            const Color.fromARGB(71, 5, 52, 49),
            Get.theme.colorScheme.background
          ],
        ),
        border: Border.all(
          width: 1.0,
          color: Get.theme.colorScheme.background.withOpacity(0.05),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Get.theme.colorScheme.onSecondary,
                borderRadius: BorderRadius.circular(12.0),
              ),
              margin:
                  const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        Strings.paymentMethod,
                        style: Get.textTheme.bodySmall
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Container(
                        height: 36.0,
                        decoration: BoxDecoration(
                          color: Get.theme.colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Obx(
                          () => DropdownButton<String>(
                            value: controller.selectedOption.value,
                            items: <String>[
                              Strings.mpesa,
                              Strings.airtelMoney,
                            ].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                ),
                              );
                            }).toList(),
                            style: Get.textTheme.bodySmall?.copyWith(),
                            onChanged: (String? newValue) {
                              controller.selectedOption.value = newValue ?? '';
                            },
                            dropdownColor: Get.theme.colorScheme.background,
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
                          Strings.keCountryCode,
                          style: Get.textTheme.bodySmall?.copyWith(
                              color: Get.theme.colorScheme.background),
                        ),
                      ),
                      _paymentTextField()
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Strings.shippingTo,
                          style: Get.textTheme.bodySmall?.copyWith(
                              color: Get.theme.colorScheme.onBackground,
                              fontWeight: FontWeight.bold),
                        ),
                        Obx(
                          () => Text(
                            controller.shippingAddress.value,
                            style: Get.textTheme.bodySmall?.copyWith(
                              color: Get.theme.primaryColorDark.withOpacity(.9),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: controller.pay,
              child: Container(
                width: Get.width * 0.6,
                padding: const EdgeInsets.all(12.0),
                margin: const EdgeInsets.symmetric(vertical: 16.0),
                decoration: BoxDecoration(
                  color: Get.theme.colorScheme.primary,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Center(
                  child: Obx(
                    () => RichText(
                      text: TextSpan(
                          text: Strings.pay,
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
                              style: Get.textTheme.bodySmall?.copyWith(
                                fontWeight: FontWeight.bold,
                                // color: Get.theme.colorScheme.background,
                              ),
                            ),
                          ],
                          style: Get.textTheme.bodyLarge),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _paymentTextField() {
    return SizedBox(
      height: 45,
      width: Get.width * 0.56,
      child: Center(
        child: TextField(
          style: Get.textTheme.bodySmall
              ?.copyWith(color: Get.theme.colorScheme.background, height: 1.5),
          keyboardType: TextInputType.phone,
          cursorColor: Get.theme.colorScheme.background,
          controller: controller.phoneController,
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none),
            fillColor: Get.theme.colorScheme.onBackground,
            focusColor: Get.theme.colorScheme.onBackground,
            filled: true,
            hintText: Strings.hintText,
            hintStyle: Get.textTheme.bodySmall
                ?.copyWith(color: Get.theme.colorScheme.background),
          ),
        ),
      ),
    );
  }
}
