import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 16.01.2023.
class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final Color backgroundColor;
  final bool isPass;
  final TextInputType textInputType;
  final String hintText;
  final IconData? icon;
  final String? suffixText;
  final void Function()? onIconTap;
  final void Function(String)? onChanged;

  const TextFieldInput(
      {Key? key,
      required this.textEditingController,
      this.isPass = false,
      required this.textInputType,
      required this.hintText,
      this.onIconTap,
      this.icon,
      this.suffixText,
      this.onChanged,
      required this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      child: Container(
        margin: const EdgeInsets.all(8.0),
        width: Get.width - 70,
        child: TextField(
          style: GoogleFonts.inter(
              fontStyle: FontStyle.normal,
              color: Colors.black,
              fontSize: 18.0,
              letterSpacing: 1.0,
              fontWeight: FontWeight.w500),
          showCursor: true,
          cursorColor: Colors.black,
          onChanged: onChanged,
          controller: textEditingController,
          decoration: InputDecoration(
            labelText: hintText,
            labelStyle: GoogleFonts.inter(
                fontStyle: FontStyle.normal,
                color: Colors.black,
                fontSize: 18.0,
                letterSpacing: 1.0,
                fontWeight: FontWeight.w300),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(width: .3, color: backgroundColor)),
            fillColor: Colors.white,
            focusColor: Colors.black,
            filled: true,
            suffixIcon: InkWell(
              onTap: onIconTap,
              child: icon == null
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 13.0),
                          child: Text(
                            suffixText!,
                            style: Get.theme.textTheme.bodyMedium?.copyWith(
                                color: Colors.black,
                                letterSpacing: 1.0,
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ],
                    )
                  : Icon(
                      icon,
                      color: Colors.black.withOpacity(0.87),
                    ),
            ),
            contentPadding: const EdgeInsets.only(top: 4, bottom: 4, right: 4),
          ),
          keyboardType: textInputType,
          obscureText: isPass,
        ),
      ),
    );
  }
}
