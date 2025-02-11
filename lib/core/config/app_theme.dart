import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color.fromARGB(255, 226, 61, 10);
  static const Color primaryColorDark = Color.fromARGB(255, 191, 51, 0);
  static const Color accentColor = Color(0xFFFFC107);
  static const Color backgroundColor = Color(0xFFF5F5F5);
  static const Color grayColor = Color.fromARGB(255, 202, 202, 202);
  static const Color yellowColor = Color.fromARGB(255, 237, 193, 17);
  static const Color scaffoldBackgroundColor = Color(0xFFF5F5F5);
  static const Color errorColor = Color(0xFFD32F2F);

  static ThemeData get lightTheme {
    final base = ThemeData.light();

    return base.copyWith(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      appBarTheme: AppBarTheme(
        backgroundColor: primaryColor,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: accentColor,
        foregroundColor: Colors.white,
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        textTheme: ButtonTextTheme.primary,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: primaryColor,
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: primaryColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: primaryColor),
        ),
        labelStyle: const TextStyle(color: primaryColor),
      ),
      textTheme: base.textTheme.copyWith(
        titleLarge: const TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
        ),
        bodyMedium: const TextStyle(
          color: Colors.black87,
        ),
      ),
      colorScheme: base.colorScheme
          .copyWith(
            primary: primaryColor,
            secondary: accentColor,
            error: errorColor,
          )
          .copyWith(surface: backgroundColor)
          .copyWith(error: errorColor),
    );
  }
}
