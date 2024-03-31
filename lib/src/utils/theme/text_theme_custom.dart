import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextThemeCustom {
  static TextTheme appTextTheme(BuildContext context) {
    return TextTheme(
      // Headline
      headlineLarge: const TextStyle().copyWith(
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).colorScheme.onBackground,
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      headlineMedium: const TextStyle().copyWith(
        fontSize: 24.0,
        fontWeight: FontWeight.w600,
        color: Theme.of(context).colorScheme.onBackground,
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      headlineSmall: const TextStyle().copyWith(
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        color: Theme.of(context).colorScheme.onBackground,
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      // Title
      titleLarge: const TextStyle().copyWith(
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).colorScheme.onBackground,
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      titleMedium: const TextStyle().copyWith(
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
        color: Theme.of(context).colorScheme.onBackground,
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      titleSmall: const TextStyle().copyWith(
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
        color: Theme.of(context).colorScheme.onBackground,
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      // Body
      bodyLarge: const TextStyle().copyWith(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        color: Theme.of(context).colorScheme.onBackground,
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      bodyMedium: const TextStyle().copyWith(
        fontSize: 14.0,
        fontWeight: FontWeight.normal,
        color: Theme.of(context).colorScheme.onBackground,
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      bodySmall: const TextStyle().copyWith(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        color: Theme.of(context).colorScheme.onBackground,
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      // Label
      labelLarge: const TextStyle().copyWith(
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
        color: Theme.of(context).colorScheme.onBackground,
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      labelMedium: const TextStyle().copyWith(
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
        color: Theme.of(context).colorScheme.onBackground,
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
    );
  }
}
