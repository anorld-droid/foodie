import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 16.01.2023.
class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final Color backgroundColor;
  final bool isPass;
  final Color textColor;

  final TextStyle? textStyle;
  final TextInputType textInputType;
  final String hintText;
  final IconData? icon;
  final int? maxLength;
  final String? suffixText;
  final String? labelText;
  final void Function()? onIconTap;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final double borderRadius;
  final double? height;
  final FocusNode? focusNode;

  const TextFieldInput(
      {Key? key,
      required this.textEditingController,
      this.isPass = false,
      this.textStyle,
      required this.textInputType,
      required this.hintText,
      this.onIconTap,
      this.icon,
      this.suffixText,
      this.labelText,
      this.onChanged,
      this.onSubmitted,
      this.focusNode,
      required this.backgroundColor,
      required this.textColor,
      this.borderRadius = 0,
      this.height,
      this.maxLength})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Center(
        child: TextField(
          focusNode: focusNode,
          style: textStyle ??
              Get.textTheme.bodyLarge?.copyWith(
                color: textColor,
              ),
          keyboardType: textInputType,
          cursorColor: textColor,
          onChanged: onChanged,
          onSubmitted: onSubmitted,
          controller: textEditingController,
          decoration: InputDecoration(
            labelText: labelText,
            hintStyle: Get.textTheme.displayMedium?.copyWith(color: textColor),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide.none),
            fillColor: backgroundColor,
            focusColor: backgroundColor,
            filled: true,
            hintText: hintText,
            suffixIcon: InkWell(
              onTap: onIconTap,
              child: Icon(
                icon,
                color: Get.theme.primaryColorDark.withOpacity(0.87),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final Color backgroundColor;
  final bool isPass;
  final TextStyle? textStyle;
  final TextInputType textInputType;
  final String hintText;
  final IconData? icon;
  final int? maxLength;
  final String? suffixText;
  final String? labelText;
  final void Function()? onIconTap;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final double borderRadius;
  final double? height;
  final FocusNode? focusNode;

  const CustomTextField(
      {Key? key,
      required this.textEditingController,
      this.isPass = false,
      this.textStyle,
      required this.textInputType,
      required this.hintText,
      this.onIconTap,
      this.icon,
      this.suffixText,
      this.labelText,
      this.onChanged,
      this.onSubmitted,
      this.focusNode,
      required this.backgroundColor,
      this.borderRadius = 0,
      this.height,
      this.maxLength})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Center(
        child: TextField(
          focusNode: focusNode,
          style: textStyle ?? Get.textTheme.bodyLarge,
          keyboardType: textInputType,
          cursorColor: Get.theme.colorScheme.background,
          onChanged: onChanged,
          onSubmitted: onSubmitted,
          scrollPadding: const EdgeInsets.all(40),
          controller: textEditingController,
          decoration: InputDecoration(
            labelText: labelText,
            labelStyle: Get.textTheme.displayMedium,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide.none),
            fillColor: backgroundColor,
            focusColor: backgroundColor,
            filled: true,
            hintText: hintText,
            hintStyle: Get.textTheme.bodySmall
                ?.copyWith(color: Get.theme.colorScheme.background),
            prefixIcon: InkWell(
              onTap: onIconTap,
              child: Icon(
                icon,
                color: Get.theme.colorScheme.background,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
