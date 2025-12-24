import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Premium Color Palette
  static const Color midnightBlue = Color(0xFF1A1F2C);
  static const Color deepEmerald = Color(0xFF0F3D3E);
  static const Color antiqueGold = Color(0xFFD4AF37);
  static const Color softCream = Color(0xFFF5F5F0);
  static const Color pureWhite = Color(0xFFFFFFFF);
  static const Color charcoal = Color(0xFF2C2C2C);
  
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: midnightBlue,
      scaffoldBackgroundColor: pureWhite,
      colorScheme: const ColorScheme.light(
        primary: midnightBlue,
        secondary: antiqueGold,
        surface: softCream,
        onPrimary: pureWhite,
        onSecondary: midnightBlue,
        onSurface: charcoal,
      ),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.playfairDisplay(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: midnightBlue,
        ),
        displayMedium: GoogleFonts.playfairDisplay(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: midnightBlue,
        ),
        bodyLarge: GoogleFonts.lato(
          fontSize: 16,
          color: charcoal,
        ),
        bodyMedium: GoogleFonts.lato(
          fontSize: 14,
          color: charcoal.withOpacity(0.8),
        ),
        labelLarge: GoogleFonts.lato(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: pureWhite,
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: pureWhite,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: midnightBlue),
        titleTextStyle: GoogleFonts.playfairDisplay(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: midnightBlue,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: midnightBlue,
          foregroundColor: pureWhite,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          textStyle: GoogleFonts.lato(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: softCream,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: antiqueGold, width: 1.5),
        ),
      ),
    );
  }

  // Dark theme implementation can be added here
}
