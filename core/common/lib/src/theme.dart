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
            Color.fromARGB(121, 255, 255, 255),
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

  List<Color> get radiantColors => isDarkMode
      ? const [Color.fromARGB(181, 5, 52, 49), Color.fromARGB(71, 5, 52, 49)]
      : [
          Colors.grey.shade300,
          Colors.grey.shade100,
        ];

  List<Color> get mainGradientColors => isDarkMode
      ? const [Colors.black, Color.fromARGB(200, 5, 52, 49), Colors.black]
      : [
          Colors.grey.shade300,
          Colors.grey.shade100,
          Colors.grey.shade100,
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

  List<Color> get appBarColors => isDarkMode
      ? const [
          Colors.black,
          Color.fromARGB(255, 5, 52, 49),
          Color.fromARGB(181, 5, 52, 49),
          Color.fromARGB(71, 5, 52, 49),
        ]
      : const [Colors.white, Colors.white];

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
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.dark,
    primaryColorDark: Colors.black,
    textTheme: TextTheme(
      displaySmall: GoogleFonts.montserratAlternates(
          fontSize: 24,
          color: Colors.black,
          letterSpacing: .0,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w400),
      headlineLarge: GoogleFonts.roboto(
          fontSize: 32,
          color: Colors.black,
          letterSpacing: .0,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w500),
      headlineMedium: GoogleFonts.montserratAlternates(
          fontSize: 28,
          color: Colors.black,
          letterSpacing: .0,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w500),
      headlineSmall: GoogleFonts.montserrat(
          fontSize: 24,
          color: Colors.black,
          letterSpacing: .0,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w500),
      labelMedium: GoogleFonts.montserratAlternates(
          fontSize: 12,
          color: Colors.black,
          letterSpacing: .0,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w500),
      labelSmall: GoogleFonts.montserratAlternates(
          fontSize: 20,
          color: Colors.black,
          letterSpacing: .0,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w400),
      bodyLarge: GoogleFonts.montserratAlternates(
          fontSize: 16,
          color: Colors.black,
          letterSpacing: .0,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w400),
      bodyMedium: GoogleFonts.montserratAlternates(
          fontSize: 18,
          color: Colors.black,
          letterSpacing: .0,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w400),
      bodySmall: GoogleFonts.montserratAlternates(
          fontSize: 14,
          color: Colors.black,
          letterSpacing: .0,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w400),
      displayMedium: GoogleFonts.montserratAlternates(
          fontSize: 16,
          color: Colors.black,
          letterSpacing: .0,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w400),
    ),
    colorScheme: ColorScheme(
        background: Colors.grey.shade100,
        brightness: Brightness.dark,
        primary: const Color(0xFF00BF63),
        onPrimary: Colors.white,
        secondary: Color(0xFF393939),
        onSecondary: Colors.white10,
        primaryContainer: Colors.transparent,
        secondaryContainer: Color.fromARGB(255, 5, 52, 49),
        error: Colors.red,
        tertiary: Colors.black,
        onError: Colors.white,
        onBackground: Colors.black,
        surface: Colors.white,
        onSurface: Colors.grey.shade300),
  );

  static final dark = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Color.fromARGB(5, 0, 0, 0),
    brightness: Brightness.light,
    primaryColorDark: Color.fromARGB(255, 250, 250, 250),
    textTheme: TextTheme(
      displaySmall: GoogleFonts.montserratAlternates(
          fontSize: 24,
          color: Colors.white,
          letterSpacing: 0.0,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w400),
      headlineLarge: GoogleFonts.roboto(
          fontSize: 32,
          color: Colors.white,
          letterSpacing: 0,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w500),
      headlineMedium: GoogleFonts.roboto(
          fontSize: 28,
          color: Colors.white,
          letterSpacing: 0,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w500),
      headlineSmall: GoogleFonts.montserrat(
          fontSize: 24,
          color: Colors.white,
          letterSpacing: 0,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w500),
      labelMedium: GoogleFonts.montserratAlternates(
          fontSize: 12,
          color: Colors.white,
          letterSpacing: 0.0,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w500),
      labelSmall: GoogleFonts.montserratAlternates(
          fontSize: 20,
          color: Colors.white,
          letterSpacing: 0.0,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w400),
      bodyLarge: GoogleFonts.montserratAlternates(
          fontSize: 16,
          color: Colors.white,
          letterSpacing: 0.0,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w400),
      bodyMedium: GoogleFonts.montserratAlternates(
          fontSize: 18,
          color: Colors.white,
          letterSpacing: 0.0,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w400),
      bodySmall: GoogleFonts.montserratAlternates(
          fontSize: 14,
          color: Colors.white,
          letterSpacing: 0.0,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w400),
      displayMedium: GoogleFonts.montserratAlternates(
          fontSize: 16,
          color: Colors.white,
          letterSpacing: 0.0,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w400),
    ),
    colorScheme: ColorScheme(
        background: Colors.black,
        brightness: Brightness.light,
        primary: Color(0xFF00BF63),
        onPrimary: Colors.white,
        secondary: Color(0xFF393939),
        onSecondary: Colors.white10,
        primaryContainer: Colors.transparent,
        secondaryContainer: Color.fromARGB(71, 5, 52, 49),
        error: Colors.red,
        tertiary: Colors.black,
        onError: Colors.white,
        onBackground: Colors.white,
        surface: Colors.grey.shade900,
        onSurface: Colors.grey),
  );
}
