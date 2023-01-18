import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 11.01.2023.
class ThemeService {
  final bool isDarkMode;

  ThemeService({required this.isDarkMode});

  /// Using isDarkMode, return ThemeMode
  ThemeMode get theme => isDarkMode ? ThemeMode.dark : ThemeMode.light;

  ///Gradients
  LinearGradient get stroke => isDarkMode
      ? const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 255, 255, 255),
            Color.fromARGB(255, 255, 255, 255),
          ],
        )
      : const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(181, 0, 0, 0),
            Color.fromARGB(121, 67, 67, 67)
          ],
        );

  LinearGradient get callButton => isDarkMode
      ? const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
              Color.fromARGB(255, 25, 25, 25),
              Color.fromARGB(127, 25, 25, 25),
              Color.fromARGB(0, 25, 25, 25),
            ])
      : const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
              Color.fromARGB(255, 230, 230, 230),
              Color.fromARGB(127, 230, 230, 230),
              Color.fromARGB(0, 230, 230, 230),
            ]);

  List<Color> get strokeColors => isDarkMode
      ? const [
          Color.fromARGB(255, 255, 255, 255),
          Color.fromARGB(90, 255, 255, 255),
          Color.fromARGB(181, 0, 0, 0),
        ]
      : const [
          Color.fromARGB(181, 0, 0, 0),
          Color.fromARGB(121, 67, 67, 67),
          Color.fromARGB(255, 255, 255, 255),
        ];

  LinearGradient get floatingABIconGradient => isDarkMode
      ? const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 255, 255, 255),
            ])
      : const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
              Color.fromARGB(255, 0, 0, 0),
              Color.fromARGB(255, 0, 0, 0),
            ]);

  LinearGradient get newsPostIcons => isDarkMode
      ? const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
              Color.fromARGB(150, 255, 255, 255),
              Color.fromARGB(150, 255, 255, 255),
            ])
      : const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
              Color.fromARGB(150, 0, 0, 0),
              Color.fromARGB(150, 0, 0, 0),
            ]);

  LinearGradient get floatingABGradient => isDarkMode
      ? const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
              Color.fromARGB(0, 217, 217, 217),
              Color.fromARGB(0, 217, 217, 217)
            ])
      : const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 255, 255, 255),
            ]);
}

class Themes {
  static const linearGradient = LinearGradient(
    colors: [
      Color(0xFF000000),
      Color(0xFF434343),
      Color.fromARGB(255, 97, 95, 95),
      Color.fromARGB(255, 97, 95, 95),
      Color.fromARGB(255, 155, 150, 150),
    ],
  );

  static final light = ThemeData.light().copyWith(
      backgroundColor: Colors.white,
      brightness: Brightness.dark,
      primaryColorDark: Colors.black,
      textTheme: TextTheme(
        displaySmall: GoogleFonts.notoSerif(
            fontSize: 24,
            color: Colors.black,
            letterSpacing: 1.0,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400),
        headlineLarge: GoogleFonts.inter(
            fontSize: 32,
            color: Colors.black,
            letterSpacing: 0,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500),
        headlineMedium: GoogleFonts.inter(
            fontSize: 28,
            color: Colors.black,
            letterSpacing: 0,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500),
        headlineSmall: GoogleFonts.inter(
            fontSize: 24,
            color: Colors.black,
            letterSpacing: 0,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500),
        labelMedium: GoogleFonts.inter(
            fontSize: 12,
            color: Colors.black,
            letterSpacing: 1.0,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500),
        labelSmall: GoogleFonts.montserrat(
            fontSize: 20,
            color: Colors.black,
            letterSpacing: 1.0,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400),
        bodyLarge: GoogleFonts.inter(
            fontSize: 16,
            color: Colors.black,
            letterSpacing: 1.0,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400),
        bodyMedium: GoogleFonts.inter(
            fontSize: 18,
            color: Colors.black,
            letterSpacing: .5,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400),
        bodySmall: GoogleFonts.rubik(
            fontSize: 14,
            color: Colors.black,
            letterSpacing: 1.0,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400),
        displayMedium: GoogleFonts.montserrat(
            fontSize: 16,
            color: Colors.black,
            letterSpacing: 1.0,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400),
      ));

  static final dark = ThemeData.dark().copyWith(
      backgroundColor: Colors.black,
      brightness: Brightness.light,
      primaryColorDark: Colors.white,
      textTheme: TextTheme(
        displaySmall: GoogleFonts.notoSerif(
            fontSize: 24,
            color: Colors.white,
            letterSpacing: 1.0,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400),
        headlineLarge: GoogleFonts.inter(
            fontSize: 32,
            color: Colors.white,
            letterSpacing: 0,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500),
        headlineMedium: GoogleFonts.inter(
            fontSize: 28,
            color: Colors.white,
            letterSpacing: 0,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500),
        headlineSmall: GoogleFonts.inter(
            fontSize: 24,
            color: Colors.white,
            letterSpacing: 0,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500),
        labelMedium: GoogleFonts.inter(
            fontSize: 12,
            color: Colors.white,
            letterSpacing: 1.0,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500),
        labelSmall: GoogleFonts.montserrat(
            fontSize: 20,
            color: Colors.white,
            letterSpacing: 1.0,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400),
        bodyLarge: GoogleFonts.inter(
            fontSize: 16,
            color: Colors.white,
            letterSpacing: 1.0,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400),
        bodyMedium: GoogleFonts.inter(
            fontSize: 18,
            color: Colors.white,
            letterSpacing: .5,
            height: 20,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400),
        bodySmall: GoogleFonts.rubik(
            fontSize: 14,
            color: Colors.white,
            letterSpacing: 1.0,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400),
        displayMedium: GoogleFonts.montserrat(
            fontSize: 16,
            color: Colors.white,
            letterSpacing: 1.0,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400),
      ));
}
