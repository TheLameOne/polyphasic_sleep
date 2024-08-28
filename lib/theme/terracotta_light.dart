import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData terracottaLight = ThemeData(
  fontFamily: GoogleFonts.openSans().fontFamily,
  colorScheme: ColorScheme.light(
    primary: HexColor("#E06E3E"), // Terracotta
    onPrimary: HexColor("#FFFFFF"),
    primaryContainer: HexColor("#E06E3E"),
    onPrimaryContainer: HexColor("#FFFFFF"),
    secondary: HexColor("#B88576"), // Soft Clay
    onSecondary: HexColor("#FFFFFF"),
    secondaryContainer: HexColor("#B88576"),
    onSecondaryContainer: HexColor("#FFFFFF"),
    tertiary: HexColor("#A58F44"), // Golden Beige
    onTertiary: HexColor("#FFFFFF"),
    tertiaryContainer: HexColor("#A58F44"),
    onTertiaryContainer: HexColor("#FFFFFF"),
    surface: HexColor("#FAF0E6"), // Light Ivory Surface
    onSurface: HexColor("#E06E3E"),
    error: HexColor("#FF5449"), // Soft Red Error
  ),
);
