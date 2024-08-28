import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData copperSandLight = ThemeData(
  fontFamily: GoogleFonts.openSans().fontFamily,
  colorScheme: ColorScheme.light(
    primary: HexColor("#C47B3C"), // Copper
    onPrimary: HexColor("#FFFFFF"),
    primaryContainer: HexColor("#C47B3C"),
    onPrimaryContainer: HexColor("#FFFFFF"),
    secondary: HexColor("#B88576"), // Soft Clay
    onSecondary: HexColor("#FFFFFF"),
    secondaryContainer: HexColor("#B88576"),
    onSecondaryContainer: HexColor("#FFFFFF"),
    tertiary: HexColor("#9E8C62"), // Desert Beige
    onTertiary: HexColor("#FFFFFF"),
    tertiaryContainer: HexColor("#9E8C62"),
    onTertiaryContainer: HexColor("#FFFFFF"),
    surface: HexColor("#F5F5DC"), // Beige Surface
    onSurface: HexColor("#C47B3C"),
    error: HexColor("#FF5449"), // Soft Red Error
  ),
);
