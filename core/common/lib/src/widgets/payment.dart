import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class Payment extends GetView<CommonController> {
  final double amount;
  final Function() onPaymentSuccesful;
  final List<String> options;
  final String? shipping;
  const Payment({
    super.key,
    required this.amount,
    required this.onPaymentSuccesful,
    this.options = const ['M-pesa', 'Airtel Money'],
    this.shipping,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.37,
      decoration: BoxDecoration(
        color: Get.theme.colorScheme.background,
        border: Border.all(
          width: .5,
          color: Get.theme.colorScheme.background.withOpacity(0.2),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Get.theme.colorScheme.surface,
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
                        CommonStrings.paymentMethod,
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
                            iconDisabledColor:
                                Get.theme.colorScheme.onBackground,
                            iconEnabledColor:
                                Get.theme.colorScheme.onBackground,
                            focusColor: Get.theme.colorScheme.onBackground,
                            items: options.map((String value) {
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
                  _paymentTextField(),
                  const SizedBox(
                    height: 12.0,
                  ),
                  shipping != null
                      ? Text(
                          shipping!,
                          style: Get.textTheme.bodyLarge,
                        )
                      : const SizedBox(),
                ],
              ),
            ),
            InkWell(
              onTap: () => controller.pay(amount, onPaymentSuccesful),
              child: Container(
                width: Get.width * 0.6,
                padding: const EdgeInsets.all(12.0),
                margin: const EdgeInsets.symmetric(vertical: 16.0),
                decoration: BoxDecoration(
                  color: Get.theme.colorScheme.primary,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      text: CommonStrings.pay,
                      children: [
                        WidgetSpan(
                          child: Transform.translate(
                              offset: const Offset(-2, -8),
                              child: Text(
                                CommonStrings.currency.toLowerCase(),
                                style: Get.textTheme.bodySmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  textBaseline: TextBaseline.alphabetic,
                                  color: Get.theme.colorScheme.onPrimary,
                                ),
                              )),
                        ),
                        TextSpan(
                          text: amount.ceil().toStringAsFixed(0),
                          style: Get.textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Get.theme.colorScheme.onPrimary,
                          ),
                        ),
                      ],
                      style: Get.textTheme.bodyLarge?.copyWith(
                        color: Get.theme.colorScheme.onPrimary,
                      ),
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0.0),
      child: Card(
        elevation: 0,
        color: Get.theme.colorScheme.onBackground,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
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
              hintText: CommonStrings.phoneNumber,
              hintStyle: Get.textTheme.displayMedium?.copyWith(
                color: Get.theme.colorScheme.secondary,
              ),
              focusColor: Get.theme.colorScheme.secondary,
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
            selectorTextStyle: Get.theme.textTheme.bodyMedium?.copyWith(
              color: Get.theme.colorScheme.secondary,
            ),
            textStyle: Get.theme.textTheme.bodyMedium?.copyWith(
              color: Get.theme.colorScheme.secondary,
            ),
            formatInput: true,
            keyboardType: const TextInputType.numberWithOptions(
                signed: true, decimal: true),
          ),
        ),
      ),
    );
  }
}
