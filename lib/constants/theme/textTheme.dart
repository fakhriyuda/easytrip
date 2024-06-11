// Usage: Define text theme for the app
// ignore_for_file: file_names

import 'package:easytrip/constants/color/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData myTheme = ThemeData(
  primaryColorDark: Colors.red,
  primaryColorLight: Colors.white,
  primarySwatch: Colors.blue,
  primaryColor: Colors.blue,
  brightness: Brightness.light,
  dividerColor: Colors.white54,
  textTheme: GoogleFonts.urbanistTextTheme().copyWith(
    displayLarge: GoogleFonts.urbanist(
        fontSize: 72.0, fontWeight: FontWeight.bold, color: Colors.black),
    displayMedium: GoogleFonts.urbanist(
        fontSize: 60.0, fontWeight: FontWeight.bold, color: Colors.black),
    displaySmall: GoogleFonts.urbanist(
        fontSize: 48.0, fontWeight: FontWeight.bold, color: Colors.black),
    headlineMedium: GoogleFonts.urbanist(
        fontSize: 34.0, fontWeight: FontWeight.bold, color: Colors.black),
    headlineSmall: GoogleFonts.urbanist(
        fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.black),
    titleLarge: GoogleFonts.urbanist(
        fontSize: 20.0, fontWeight: FontWeight.w700, color: Colors.black),
    titleMedium: GoogleFonts.urbanist(
        fontSize: 16.0, fontWeight: FontWeight.w700, color: AppColor.grey),
    titleSmall: GoogleFonts.urbanist(
        fontSize: 14.0, fontWeight: FontWeight.w700, color: Colors.black),
    bodyLarge: GoogleFonts.urbanist(
        fontSize: 16.0, fontWeight: FontWeight.normal, color: Colors.black),
    bodyMedium: GoogleFonts.urbanist(
        fontSize: 14.0, fontWeight: FontWeight.normal, color: Colors.black),
    bodySmall: GoogleFonts.urbanist(
        fontSize: 12.0, fontWeight: FontWeight.normal, color: Colors.black),
    labelLarge: GoogleFonts.urbanist(
        fontSize: 14.0, fontWeight: FontWeight.bold, color: Colors.black),
    labelMedium: GoogleFonts.urbanist(
        fontSize: 12.0, fontWeight: FontWeight.normal, color: AppColor.grey),
    labelSmall: GoogleFonts.urbanist(
        fontSize: 10.0, fontWeight: FontWeight.normal, color: Colors.black),
  ),
);
