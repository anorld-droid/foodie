import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final TextInputType textInputType;
  final String hintText;
  final icon;
  final Function()? onIconTap;
  const TextFieldInput(
      {Key? key,
      required this.textEditingController,
      this.isPass = false,
      required this.textInputType,
      required this.hintText,
      this.onIconTap,
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));
    return Container(
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
        controller: textEditingController,
        decoration: InputDecoration(
          labelText: hintText,
          labelStyle: GoogleFonts.inter(
              fontStyle: FontStyle.normal,
              color: Colors.black,
              fontSize: 18.0,
              letterSpacing: 1.0,
              fontWeight: FontWeight.w300),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(width: .3, color: Colors.black)),
          fillColor: Colors.white,
          focusColor: Colors.black,
          filled: true,
          suffixIcon: InkWell(
            onTap: onIconTap,
            child: Icon(
              icon,
              color: Colors.black.withOpacity(0.87),
            ),
          ),
          contentPadding: const EdgeInsets.only(top: 4, bottom: 4, right: 4),
        ),
        keyboardType: textInputType,
        obscureText: isPass,
      ),
    );
  }
}
