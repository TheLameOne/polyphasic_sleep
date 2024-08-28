import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData light = ThemeData(
    fontFamily: GoogleFonts.roboto().fontFamily,
    colorScheme: const ColorScheme.light(
      primary: Color(0xff9e9e9e), // equivalent to Colors.grey.shade500
      onPrimary: Color(0xff212121), // Dark grey for text on primary
      primaryContainer: Color(0xffbdbdbd), // Light grey container
      onPrimaryContainer:
          Color(0xff424242), // Darker grey for text on primary container
      secondary: Color(0xffeeeeee), // equivalent to Colors.grey.shade200
      onSecondary: Color(0xff616161), // Medium grey for text on secondary
      secondaryContainer:
          Color(0xffe0e0e0), // Light grey container for secondary
      onSecondaryContainer:
          Color(0xff424242), // Darker grey for text on secondary container
      tertiary: Color(0xffffffff), // White for tertiary elements
      onTertiary: Color(0xff616161), // Medium grey text on tertiary
      tertiaryContainer: Color(0xfff5f5f5), // Light grey container for tertiary
      onTertiaryContainer:
          Color(0xff212121), // Dark grey text on tertiary container
      error: Color(0xffd32f2f), // Red for errors
      onError: Color(0xffffffff), // White text on error
      errorContainer: Color(0xffffcdd2), // Light red container for errors
      onErrorContainer: Color(0xffb71c1c), // Dark red text on error container
      surface: Color(0xffe0e0e0), // equivalent to Colors.grey.shade300
      onSurface: Color(0xff212121), // Dark grey text on surface
      onSurfaceVariant:
          Color(0xff757575), // Medium grey text on surface variant
      outline: Color(0xff9e9e9e), // Medium grey for outlines
      outlineVariant: Color(0xff616161), // Darker variant for outlines
      shadow: Color(0xff000000), // Black for shadows
      scrim: Color(0xff000000), // Black for overlays
      inverseSurface: Color(0xff424242), // Dark grey for inverse surfaces
      inversePrimary: Color(0xff616161), // Dark grey inverse primary
      primaryFixed: Color(0xfff5f5f5), // Light grey for fixed primary
      onPrimaryFixed: Color(0xff212121), // Dark text on fixed primary
      primaryFixedDim: Color(0xffe0e0e0), // Dimmed fixed primary
      onPrimaryFixedVariant: Color(0xff757575), // Variant for fixed primary
      secondaryFixed: Color(0xfff5f5f5), // Light grey for fixed secondary
      onSecondaryFixed: Color(0xff212121), // Dark text on fixed secondary
      secondaryFixedDim: Color(0xffe0e0e0), // Dimmed fixed secondary
      onSecondaryFixedVariant: Color(0xff616161), // Variant for fixed secondary
      tertiaryFixed: Color(0xfff5f5f5), // Light grey for fixed tertiary
      onTertiaryFixed: Color(0xff212121), // Dark text on fixed tertiary
      tertiaryFixedDim: Color(0xffeeeeee), // Dimmed fixed tertiary
      onTertiaryFixedVariant: Color(0xff616161), // Variant for fixed tertiary
      surfaceDim: Color(0xffcfcfcf), // Dimmed surface equivalent to surface
      surfaceBright: Color(0xffffffff), // Bright surface (white)
      surfaceContainerLowest: Color(0xfff0f0f0), // Very light surface container
      surfaceContainerLow: Color(0xffe5e5e5), // Light surface container
      surfaceContainer: Color(0xffeeeeee), // Standard light surface container
      surfaceContainerHigh:
          Color(0xfff5f5f5), // High contrast light surface container
      surfaceContainerHighest:
          Color(0xffffffff), // Highest contrast light surface container
    ));
