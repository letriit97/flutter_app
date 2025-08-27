import 'package:flutter/material.dart';

class AppThemes {
  static final light = ThemeData(
    primaryColor: const Color(0xFFFF5722),
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
    ),
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: const Color(0xFFFF5722),
      onPrimary: Colors.white,
      secondary: const Color(0xFF03DAC6),
      onSecondary: Colors.black,
      error: const Color.fromARGB(255, 252, 0, 46),
      onError: Colors.white,
      surface: Colors.white,
      onSurface: Colors.black,
    ),
    cardColor: Colors.white,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: Color(0xFFFF5722),
      unselectedItemColor: Colors.grey,
    ),
  );

  static final dark = ThemeData(
    primaryColor: const Color(0xFFFF5722),
    scaffoldBackgroundColor: const Color(0xFF121212),
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      elevation: 0,
      iconTheme: IconThemeData(color: Color(0xFF121212)),
    ),
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: const Color(0xFFFF5722),
      onPrimary: Colors.white,
      secondary: const Color(0xFF03DAC6),
      onSecondary: Colors.black,
      error: const Color.fromARGB(255, 252, 0, 46),
      onError: const Color(0xFF121212),
      surface: const Color(0xFF121212),
      onSurface: Colors.black,
    ),
    cardColor: const Color(0xFF121212),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF121212),
      selectedItemColor: Color(0xFFFF5722),
      unselectedItemColor: Colors.grey,
    ),
  );
}
