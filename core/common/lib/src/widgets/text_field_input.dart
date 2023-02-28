import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 16.01.2023.
class TextFieldInput extends StatelessWidget {
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
      this.borderRadius = 0,
      this.height,
      this.maxLength})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
      ),
      child: SizedBox(
        height: height,
        child: Center(
          child: TextField(
            focusNode: focusNode,
            style: textStyle ?? Get.textTheme.bodyLarge,
            keyboardType: textInputType,
            cursorColor: Get.theme.primaryColorDark,
            onChanged: onChanged,
            onSubmitted: onSubmitted,
            controller: textEditingController,
            decoration: InputDecoration(
              labelText: labelText,
              labelStyle: Get.textTheme.displayMedium,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
              ),
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
          cursorColor: Get.theme.primaryColorDark,
          onChanged: onChanged,
          onSubmitted: onSubmitted,
          scrollPadding: const EdgeInsets.all(40),
          controller: textEditingController,
          decoration: InputDecoration(
            labelText: labelText,
            labelStyle: Get.textTheme.displayMedium,
            contentPadding: const EdgeInsets.only(
              left: 32,
            ),
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
