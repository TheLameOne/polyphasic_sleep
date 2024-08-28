import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData warmEarthLight = ThemeData(
  fontFamily: GoogleFonts.openSans().fontFamily,
  colorScheme: ColorScheme.light(
    primary: HexColor("#B33B15"), // Deep Brick Red
    onPrimary: HexColor("#FFFFFF"),
    primaryContainer: HexColor("#B33B15"),
    onPrimaryContainer: HexColor("#FFFFFF"),
    secondary: HexColor("#B88576"), // Soft Clay
    onSecondary: HexColor("#FFFFFF"),
    secondaryContainer: HexColor("#B88576"),
    onSecondaryContainer: HexColor("#FFFFFF"),
    tertiary: HexColor("#A58F44"), // Golden Beige
    onTertiary: HexColor("#FFFFFF"),
    tertiaryContainer: HexColor("#A58F44"),
    onTertiaryContainer: HexColor("#FFFFFF"),
    surface: HexColor("#F5F5F5"), // Light Neutral Surface
    onSurface: HexColor("#B33B15"),
    error: HexColor("#FF5449"), // Soft Red Error
  ),
);
