import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData mutedDesertLight = ThemeData(
  fontFamily: GoogleFonts.openSans().fontFamily,
  colorScheme: ColorScheme.light(
    primary: HexColor("#BA6A28"), // Warm Copper
    onPrimary: HexColor("#FFFFFF"),
    primaryContainer: HexColor("#BA6A28"),
    onPrimaryContainer: HexColor("#FFFFFF"),
    secondary: HexColor("#B88576"), // Soft Clay
    onSecondary: HexColor("#FFFFFF"),
    secondaryContainer: HexColor("#B88576"),
    onSecondaryContainer: HexColor("#FFFFFF"),
    tertiary: HexColor("#8F6D33"), // Dusty Olive
    onTertiary: HexColor("#FFFFFF"),
    tertiaryContainer: HexColor("#8F6D33"),
    onTertiaryContainer: HexColor("#FFFFFF"),
    surface: HexColor("#EFEFEF"), // Light Grey Surface
    onSurface: HexColor("#BA6A28"),
    error: HexColor("#FF5449"), // Soft Red Error
  ),
);
