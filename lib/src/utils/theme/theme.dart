import 'package:expense_app/src/utils/theme/text_theme_custom.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme(BuildContext context) => ThemeData(
      useMaterial3: true,
      fontFamily: GoogleFonts.poppins().fontFamily,
      textTheme: TextThemeCustom.appTextTheme(context),
      colorScheme: const ColorScheme.light(
        brightness: Brightness.light,
        primary: Color(0xFF006971),
        onPrimary: Color(0xFFFFFFFF),
        primaryContainer: Color(0xFF84F3FF),
        onPrimaryContainer: Color(0xFF002023),
        secondary: Color(0xFF4A6365),
        onSecondary: Color(0xFFFFFFFF),
        secondaryContainer: Color(0xFFCCE7EB),
        onSecondaryContainer: Color(0xFF051F22),
        tertiary: Color(0xFFBA025E),
        onTertiary: Color(0xFFFFFFFF),
        tertiaryContainer: Color(0xFFFFD9E1),
        onTertiaryContainer: Color(0xFF3F001B),
        error: Color(0xFFBA1A1A),
        errorContainer: Color(0xFFFFDAD6),
        onError: Color(0xFFFFFFFF),
        onErrorContainer: Color(0xFF410002),
        background: Color(0xFFFAFDFD),
        onBackground: Color(0xFF191C1D),
        surface: Color(0xFFFAFDFD),
        onSurface: Color(0xFF191C1D),
        surfaceVariant: Color(0xFFDAE4E5),
        onSurfaceVariant: Color(0xFF3F484A),
        outline: Color(0xFF6F797A),
        onInverseSurface: Color(0xFFEFF1F1),
        inverseSurface: Color(0xFF2D3131),
        inversePrimary: Color(0xFF4DD9E6),
        shadow: Color(0xFF000000),
        surfaceTint: Color(0xFF006971),
        outlineVariant: Color(0xFFBEC8C9),
        scrim: Color(0xFF000000),
      ),
    );

ThemeData darkTheme(BuildContext context) => ThemeData(
      useMaterial3: true,
      fontFamily: GoogleFonts.poppins().fontFamily,
      textTheme: TextThemeCustom.appTextTheme(context),
      colorScheme: const ColorScheme.dark(
        brightness: Brightness.dark,
        primary: Color(0xFF4DD9E6),
        onPrimary: Color(0xFF00363B),
        primaryContainer: Color(0xFF004F55),
        onPrimaryContainer: Color(0xFF84F3FF),
        secondary: Color(0xFFB1CBCE),
        onSecondary: Color(0xFF1C3437),
        secondaryContainer: Color(0xFF324B4E),
        onSecondaryContainer: Color(0xFFCCE7EB),
        tertiary: Color(0xFFFFB1C5),
        onTertiary: Color(0xFF650030),
        tertiaryContainer: Color(0xFF8E0046),
        onTertiaryContainer: Color(0xFFFFD9E1),
        error: Color(0xFFFFB4AB),
        errorContainer: Color(0xFF93000A),
        onError: Color(0xFF690005),
        onErrorContainer: Color(0xFFFFDAD6),
        background: Color(0xFF191C1D),
        onBackground: Color(0xFFE0E3E3),
        surface: Color(0xFF191C1D),
        onSurface: Color(0xFFE0E3E3),
        surfaceVariant: Color(0xFF3F484A),
        onSurfaceVariant: Color(0xFFBEC8C9),
        outline: Color(0xFF899294),
        onInverseSurface: Color(0xFF191C1D),
        inverseSurface: Color(0xFFE0E3E3),
        inversePrimary: Color(0xFF006971),
        shadow: Color(0xFF000000),
        surfaceTint: Color(0xFF4DD9E6),
        outlineVariant: Color(0xFF3F484A),
        scrim: Color(0xFF000000),
      ),
    );
