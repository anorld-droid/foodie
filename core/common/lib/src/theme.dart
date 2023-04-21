import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 11.01.2023.
class ThemeService {
  final bool isDarkMode;

  ThemeService({required this.isDarkMode});

  /// Using isDarkMode, return ThemeMode
  ThemeMode get theme => isDarkMode ? ThemeMode.dark : ThemeMode.light;

  List<Color> get radiantColors => isDarkMode
      ? const [Color.fromARGB(181, 5, 52, 49), Color.fromARGB(71, 5, 52, 49)]
      : [
          Colors.grey.shade300,
          Colors.grey.shade100,
        ];

  List<Color> get appBarColors => isDarkMode
      ? const [
          Colors.black,
          Color.fromARGB(255, 5, 52, 49),
          Color.fromARGB(181, 5, 52, 49),
          Color.fromARGB(71, 5, 52, 49),
        ]
      : const [Colors.white, Colors.white];
}

class Themes {
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
        secondary: Colors.white,
        onSecondary: Colors.white10,
        primaryContainer: Colors.transparent,
        secondaryContainer: const Color.fromARGB(255, 5, 52, 49),
        error: Colors.red,
        tertiary: Colors.black,
        onError: Colors.white,
        onBackground: Colors.black,
        surface: Colors.white,
        onSurface: Colors.grey.shade300),
  );

  static final dark = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: const Color.fromARGB(5, 0, 0, 0),
    brightness: Brightness.light,
    primaryColorDark: const Color.fromARGB(255, 250, 250, 250),
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
        primary: const Color(0xFF00BF63),
        onPrimary: Colors.white,
        secondary: Colors.black,
        onSecondary: Colors.white10,
        primaryContainer: Colors.transparent,
        secondaryContainer: const Color.fromARGB(71, 5, 52, 49),
        error: Colors.red,
        tertiary: Colors.black,
        onError: Colors.white,
        onBackground: Colors.white,
        surface: Colors.grey.shade900,
        onSurface: Colors.grey.shade300),
  );
}
