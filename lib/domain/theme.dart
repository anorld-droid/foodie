import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeService {
  final _box = GetStorage();
  final _key = 'isDarkMode';

  /// Get isDarkMode info from local storage and return ThemeMode
  ThemeMode get theme => _loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;

  /// Load isDArkMode from local storage and if it's empty, returns false (that means default theme is light)
  bool _loadThemeFromBox() => _box.read(_key) ?? false;

  /// Save isDarkMode to local storage
  _saveThemeToBox(bool isDarkMode) => _box.write(_key, isDarkMode);

  ///Gradients
  LinearGradient get stroke => _loadThemeFromBox()
      ? const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(90, 255, 255, 255)
            ])
      : const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
              Color.fromARGB(181, 0, 0, 0),
              Color.fromARGB(121, 67, 67, 67)
            ]);

  /// Switch theme and save to local storage
  void switchTheme() {
    Get.changeThemeMode(_loadThemeFromBox() ? ThemeMode.light : ThemeMode.dark);
    _saveThemeToBox(!_loadThemeFromBox());
  }
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
      textTheme: TextTheme(
          displaySmall: GoogleFonts.notoSerif(
              fontSize: 24,
              color: Colors.black,
              letterSpacing: 1.0,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400),
          labelMedium: GoogleFonts.inter(
              fontSize: 12,
              color: Colors.black,
              letterSpacing: 1.0,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500),
          labelSmall: GoogleFonts.montserrat(
              fontSize: 12,
              color: Colors.black,
              letterSpacing: 1.0,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400),
          bodyMedium: GoogleFonts.inter(
              fontSize: 12,
              color: Colors.black,
              letterSpacing: 1.0,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400),
          bodySmall: GoogleFonts.rubik(
              fontSize: 8,
              color: Colors.black,
              letterSpacing: 1.0,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400)));
  static final dark = ThemeData.dark().copyWith(
      backgroundColor: Colors.black,
      textTheme: TextTheme(
          displaySmall: GoogleFonts.notoSerif(
              fontSize: 24,
              color: Colors.white,
              letterSpacing: 1.0,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400),
          labelMedium: GoogleFonts.inter(
              fontSize: 12,
              color: Colors.white,
              letterSpacing: 1.0,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500),
          labelSmall: GoogleFonts.montserrat(
              fontSize: 12,
              color: Colors.white,
              letterSpacing: 1.0,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400),
          bodyMedium: GoogleFonts.inter(
              fontSize: 12,
              color: Colors.white,
              letterSpacing: 1.0,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400),
          bodySmall: GoogleFonts.rubik(
              fontSize: 8,
              color: Colors.white,
              letterSpacing: 1.0,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400)));
}
