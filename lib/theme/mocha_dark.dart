import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData mochaDark = ThemeData(
  fontFamily: GoogleFonts.openSans().fontFamily,
  colorScheme: ColorScheme.dark(
    primary: HexColor("#8B5E34"), // Mocha Brown
    onPrimary: HexColor("#FFFFFF"),
    primaryContainer: HexColor("#8B5E34"),
    onPrimaryContainer: HexColor("#FFFFFF"),
    secondary: HexColor("#6E4C44"), // Dark Clay
    onSecondary: HexColor("#FFFFFF"),
    secondaryContainer: HexColor("#6E4C44"),
    onSecondaryContainer: HexColor("#FFFFFF"),
    tertiary: HexColor("#504026"), // Dark Beige
    onTertiary: HexColor("#FFFFFF"),
    tertiaryContainer: HexColor("#504026"),
    onTertiaryContainer: HexColor("#FFFFFF"),
    surface: HexColor("#303030"), // Dark Neutral Surface
    onSurface: HexColor("#FFFFFF"),
    error: HexColor("#FF5449"), // Soft Red Error
  ),
);