import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightMode = ThemeData(
    // fontFamily: GoogleFonts.roboto().fontFamily,
    fontFamily: GoogleFonts.openSans().fontFamily,
    colorScheme: ColorScheme.light(
        surface: Colors.grey.shade300,
        primary: Colors.grey.shade500,
        secondary: Colors.grey.shade200,
        tertiary: Colors.grey.shade800,
        inversePrimary: Colors.grey.shade800));
