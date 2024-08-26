import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData redMode = ThemeData(
    fontFamily: GoogleFonts.openSans().fontFamily,
    colorScheme: ColorScheme.dark(
      surface: Colors.red.shade900,
      primary: Colors.grey.shade600,
      secondary: Colors.grey.shade800,
      // tertiary: Colors.grey.shade800,
      inversePrimary: Colors.grey.shade300,
      tertiary: Colors.grey.shade400,
    ));
