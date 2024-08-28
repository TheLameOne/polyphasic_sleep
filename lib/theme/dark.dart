import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData dark = ThemeData(
    fontFamily: GoogleFonts.openSans().fontFamily,
    colorScheme: const ColorScheme.dark(
      primary: Color(0xff757575), // equivalent to Colors.grey.shade600
      onPrimary:
          Color(0xff212121), // A darker grey to contrast with the primary
      primaryContainer: Color(0xff424242), // Dark grey container
      onPrimaryContainer:
          Color(0xffe0e0e0), // Light grey text on primary container
      secondary: Color(0xff424242), // equivalent to Colors.grey.shade800
      onSecondary: Color(0xffbdbdbd), // Lighter grey for text on secondary
      secondaryContainer:
          Color(0xff616161), // Slightly lighter grey for container
      onSecondaryContainer: Color(0xfff5f5f5), // Even lighter grey for text
      tertiary: Color(0xff9e9e9e), // A middle grey for tertiary elements
      onTertiary: Color(0xff212121), // Dark grey for text on tertiary
      tertiaryContainer: Color(0xff424242), // Darker container for tertiary
      onTertiaryContainer:
          Color(0xffe0e0e0), // Light grey text on tertiary container
      error: Color(0xffcf6679), // A reddish color for errors
      onError: Color(0xff370b0e), // Dark red text on error
      errorContainer: Color(0xffb00020), // Dark red container for errors
      onErrorContainer: Color(0xffffb4a9), // Light pink text on error container
      surface: Color(0xff212121), // equivalent to Colors.grey.shade900
      onSurface: Color(0xffe0e0e0), // Light grey text on surface
      onSurfaceVariant: Color(0xffcfcfcf), // Slightly darker grey text
      outline: Color(0xff757575), // A grey outline color
      outlineVariant: Color(0xff494949), // Darker variant for outlines
      shadow: Color(0xff000000), // Black for shadows
      scrim: Color(0xff000000), // Black for overlays
      inverseSurface: Color(0xffe0e0e0), // Light grey for inverse surfaces
      inversePrimary: Color(0xff424242), // Dark grey inverse primary
      primaryFixed: Color(0xffbdbdbd), // A fixed light grey for primary
      onPrimaryFixed: Color(0xff212121), // Dark text on fixed primary
      primaryFixedDim: Color(0xff757575), // Dimmed fixed primary
      onPrimaryFixedVariant: Color(0xff424242), // Variant for fixed primary
      secondaryFixed: Color(0xffbdbdbd), // Light grey for fixed secondary
      onSecondaryFixed: Color(0xff212121), // Dark text on fixed secondary
      secondaryFixedDim: Color(0xff616161), // Dimmed fixed secondary
      onSecondaryFixedVariant: Color(0xff424242), // Variant for fixed secondary
      tertiaryFixed: Color(0xffbdbdbd), // Light grey for fixed tertiary
      onTertiaryFixed: Color(0xff212121), // Dark text on fixed tertiary
      tertiaryFixedDim: Color(0xff9e9e9e), // Dimmed fixed tertiary
      onTertiaryFixedVariant: Color(0xff616161), // Variant for fixed tertiary
      surfaceDim: Color(0xff212121), // Dimmed surface equivalent to surface
      surfaceBright: Color(0xff484848), // Brighter surface
      surfaceContainerLowest: Color(0xff121212), // Very dark surface container
      surfaceContainerLow: Color(0xff1c1c1c), // Dark surface container
      surfaceContainer: Color(0xff242424), // Standard dark surface container
      surfaceContainerHigh:
          Color(0xff2c2c2c), // High contrast surface container
      surfaceContainerHighest:
          Color(0xff353535), // Highest contrast surface container
    ));
