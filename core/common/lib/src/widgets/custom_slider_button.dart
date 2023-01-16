import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slider_button/slider_button.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 16.01.2023.

class CustomSliderButton extends StatelessWidget {
  final void Function() action;
  final String actionName;

  const CustomSliderButton(
      {Key? key, required this.action, required this.actionName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 43,
          width: 305,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(100)),
              gradient: LinearGradient(
                colors: [
                  // Color(0xFF000000),
                  Color(0xFF000000),
                  Color(0xFF434343),
                  Color.fromARGB(255, 97, 95, 95),
                  Color.fromARGB(255, 97, 95, 95),
                  Color.fromARGB(255, 155, 150, 150),
                ],
              )),
          child: SliderButton(
              height: 40,
              width: 302,
              buttonSize: 32,
              baseColor: Colors.white,
              alignLabel: Alignment.center,
              backgroundColor: Colors.black,
              highlightedColor: Colors.black,
              vibrationFlag: true,
              action: action,
              label: Text(
                actionName,
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                    fontStyle: FontStyle.normal,
                    color: Colors.white,
                    fontSize: 18.0,
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.w600),
              ),
              icon: const Icon(Icons.chevron_right_outlined)),
        ),
      ],
    );
  }
}
