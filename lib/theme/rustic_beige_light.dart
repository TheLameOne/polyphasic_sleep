import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData rusticBeigeLight = ThemeData(
  fontFamily: GoogleFonts.openSans().fontFamily,
  colorScheme: ColorScheme.light(
    primary: HexColor("#B33B15"), // Deep Brick Red
    onPrimary: HexColor("#FFFFFF"),
    primaryContainer: HexColor("#B33B15"),
    onPrimaryContainer: HexColor("#FFFFFF"),
    secondary: HexColor("#D9B38C"), // Light Beige
    onSecondary: HexColor("#B33B15"),
    secondaryContainer: HexColor("#D9B38C"),
    onSecondaryContainer: HexColor("#B33B15"),
    tertiary: HexColor("#A58F44"), // Golden Beige
    onTertiary: HexColor("#B33B15"),
    tertiaryContainer: HexColor("#A58F44"),
    onTertiaryContainer: HexColor("#B33B15"),
    surface: HexColor("#FAF0E6"), // Light Ivory Surface
    onSurface: HexColor("#B33B15"),
    error: HexColor("#FF5449"), // Soft Red Error
  ),
);
