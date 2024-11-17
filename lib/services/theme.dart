import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static var theme = ThemeData(
    colorScheme: const ColorScheme.dark(),
    fontFamily: GoogleFonts.poppins().fontFamily,
    textTheme: TextTheme(
    displayLarge: GoogleFonts.poppins(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    displayMedium: GoogleFonts.poppins(
      fontSize: 28,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    displaySmall: GoogleFonts.poppins(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    headlineMedium: GoogleFonts.poppins(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    headlineSmall: GoogleFonts.poppins(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    titleLarge: GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    bodyLarge: GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
    bodyMedium: GoogleFonts.poppins(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
    labelLarge: GoogleFonts.poppins(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    bodySmall: GoogleFonts.poppins(
      fontSize: 10,
      fontWeight: FontWeight.w300,
      color: Colors.white,
    ),
  )
  );
}
