

import 'package:flutter/material.dart';

ThemeData theme(){
  return ThemeData(
    scaffoldBackgroundColor: Color(0xFFFFFFFF),
    fontFamily: 'Roboto',
    //useMaterial3: true,
    textTheme: TextTheme(),
  );
}
// https://api.flutter.dev/flutter/material/TextTheme-class.html
TextTheme textTheme(){
  return const TextTheme(
    headlineLarge: TextStyle(
      color: Colors.black,
      fontSize: 32,
      fontWeight: FontWeight.bold
    ),
    headlineMedium: TextStyle(
      color: Colors.black,
      fontSize: 28,
      fontWeight: FontWeight.w500
    ),
    headlineSmall: TextStyle(
      color: Color(0xFF8F1F63),
      fontSize: 24,
      fontWeight: FontWeight.bold
    ),

// Title

    titleLarge: TextStyle(
      color: Colors.white,
      fontSize: 22,
      fontWeight: FontWeight.w500
    ),
    titleMedium: TextStyle(
      color: Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.w500
    ),
    titleSmall: TextStyle(
      color: Color(0xFF8F1F63),
      fontSize: 14,
      fontWeight: FontWeight.normal
    ),

// Body Text

    bodyLarge: TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.normal,
    ),
    bodyMedium: TextStyle(
      color: Colors.black,
      fontSize: 14,
      fontWeight: FontWeight.normal
    ),
    bodySmall: TextStyle(
      color: Color(0xFF6D6C6C),
      fontSize: 12,
      fontWeight: FontWeight.normal
    ),

// Label

    labelLarge: TextStyle(
      color: Colors.white,
      fontSize: 14,
      fontWeight: FontWeight.normal,
    ),
    labelMedium: TextStyle(
      color: Colors.black,
      fontSize: 12,
      fontWeight: FontWeight.normal
    ),
    labelSmall: TextStyle(
      color: Color(0xFF6D6C6C),
      fontSize: 11,
      fontWeight: FontWeight.normal
    ),
  );
}
