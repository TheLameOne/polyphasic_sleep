import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData mutedDesertLight = ThemeData(
  fontFamily: GoogleFonts.openSans().fontFamily,
  colorScheme: const ColorScheme.light(
    primary: Color(0xff415f91), // Copper
    onPrimary: Color(0xffd6e3ff),
    primaryContainer: Color(0xffd6e3ff),
    onPrimaryContainer: Color(0xff001b3e),
    secondary: Color(0xff565f71), // Soft Clay
    onSecondary: Color(0xffffffff),
    secondaryContainer: Color(0xffdae2f9),
    onSecondaryContainer: Color(0xff131c2b),
    tertiary: Color(0xff705575), // Desert Beige
    onTertiary: Color(0xffffffff),
    tertiaryContainer: Color(0xfffad8fd),
    onTertiaryContainer: Color(0xff28132e),
    surface: Color(0xfff9f9ff), // Beige Surface
    onSurface: Color(0xff191c20),
    error: Color(0xffba1a1a), // Soft Red Error
  ),
);
