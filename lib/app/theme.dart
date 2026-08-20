import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: const Color(0xFFF7F5FF),
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF6C4BEF),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFF7F5FF),
      foregroundColor: Color(0xFF17142B),
      elevation: 0,
    ),
    navigationBarTheme: const NavigationBarThemeData(
      backgroundColor: Colors.white,
      indicatorColor: Color(0xFFE9DEFF),
    ),
  );
}