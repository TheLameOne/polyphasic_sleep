import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData light = ThemeData(
    fontFamily: GoogleFonts.openSans().fontFamily,
    colorScheme: const ColorScheme.light(
      primary: Color(0xff000000),
      surfaceTint: Color(0xff5e5e5e),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color.fromARGB(255, 63, 63, 63),
      onPrimaryContainer: Color.fromARGB(255, 17, 17, 17),
      secondary: Color(0xff5e5e5e),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffe6e6e6),
      onSecondaryContainer: Color(0xff4a4a4a),
      tertiary: Color.fromARGB(255, 34, 34, 34),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff262626),
      onTertiaryContainer: Color(0xffb1b1b1),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      surface: Color(0xfff9f9f9),
      onSurface: Color(0xff1b1b1b),
      onSurfaceVariant: Color(0xff4c4546),
      outline: Color(0xff7e7576),
      outlineVariant: Color(0xffcfc4c5),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff303030),
      inversePrimary: Color(0xffc6c6c6),
      primaryFixed: Color(0xffe2e2e2),
      onPrimaryFixed: Color(0xff1b1b1b),
      primaryFixedDim: Color(0xffc6c6c6),
      onPrimaryFixedVariant: Color(0xff474747),
      secondaryFixed: Color(0xffe2e2e2),
      onSecondaryFixed: Color(0xff1b1b1b),
      secondaryFixedDim: Color(0xffc6c6c6),
      onSecondaryFixedVariant: Color(0xff474747),
      tertiaryFixed: Color(0xffe2e2e2),
      onTertiaryFixed: Color(0xff1b1b1b),
      tertiaryFixedDim: Color(0xffc6c6c6),
      onTertiaryFixedVariant: Color(0xff474747),
      surfaceDim: Color(0xffdadada),
      surfaceBright: Color(0xfff9f9f9),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff3f3f3),
      surfaceContainer: Color(0xffeeeeee),
      surfaceContainerHigh: Color(0xffe8e8e8),
      surfaceContainerHighest: Color(0xffe2e2e2),
      // primary: Color(0xff9e9e9e), // equivalent to Colors.grey.shade500
      // onPrimary: Color(0xff212121), // Dark grey for text on primary
      // primaryContainer: Color(0xffbdbdbd), // Light grey container
      // onPrimaryContainer: Colors.black,
      // // Color(0xff424242), // Darker grey for text on primary container
      // secondary: Color(0xffeeeeee), // equivalent to Colors.grey.shade200
      // onSecondary: Color(0xff616161), // Medium grey for text on secondary
      // secondaryContainer: Colors.grey.shade300,
      // // Color(0xffe0e0e0), // Light grey container for secondary
      // onSecondaryContainer:
      //     Color(0xff424242), // Darker grey for text on secondary container
      // tertiary: Colors.black,
      // // Color(0xffffffff), // White for tertiary elements
      // onTertiary: Color(0xff616161), // Medium grey text on tertiary
      // tertiaryContainer: Color(0xfff5f5f5), // Light grey container for tertiary
      // onTertiaryContainer:
      //     Color(0xff212121), // Dark grey text on tertiary container
      // error: Color(0xffd32f2f), // Red for errors
      // onError: Color(0xffffffff), // White text on error
      // errorContainer: Color(0xffffcdd2), // Light red container for errors
      // onErrorContainer: Color(0xffb71c1c), // Dark red text on error container
      // surface: Colors.grey.shade100,
      // // Color(0xffe0e0e0), // equivalent to Colors.grey.shade300
      // onSurface: Color(0xff212121), // Dark grey text on surface
      // onSurfaceVariant:
      //     Color(0xff757575), // Medium grey text on surface variant
      // outline: Color(0xff9e9e9e), // Medium grey for outlines
      // outlineVariant: Color(0xff616161), // Darker variant for outlines
      // shadow: Color(0xff000000), // Black for shadows
      // scrim: Color(0xff000000), // Black for overlays
      // inverseSurface: Color(0xff424242), // Dark grey for inverse surfaces
      // inversePrimary: Color(0xff616161), // Dark grey inverse primary
      // primaryFixed: Color(0xfff5f5f5), // Light grey for fixed primary
      // onPrimaryFixed: Color(0xff212121), // Dark text on fixed primary
      // primaryFixedDim: Color(0xffe0e0e0), // Dimmed fixed primary
      // onPrimaryFixedVariant: Color(0xff757575), // Variant for fixed primary
      // secondaryFixed: Color(0xfff5f5f5), // Light grey for fixed secondary
      // onSecondaryFixed: Color(0xff212121), // Dark text on fixed secondary
      // secondaryFixedDim: Color(0xffe0e0e0), // Dimmed fixed secondary
      // onSecondaryFixedVariant: Color(0xff616161), // Variant for fixed secondary
      // tertiaryFixed: Color(0xfff5f5f5), // Light grey for fixed tertiary
      // onTertiaryFixed: Color(0xff212121), // Dark text on fixed tertiary
      // tertiaryFixedDim: Color(0xffeeeeee), // Dimmed fixed tertiary
      // onTertiaryFixedVariant: Color(0xff616161), // Variant for fixed tertiary
      // surfaceDim: Color(0xffcfcfcf), // Dimmed surface equivalent to surface
      // surfaceBright: Color(0xffffffff), // Bright surface (white)
      // surfaceContainerLowest: Color(0xfff0f0f0), // Very light surface container
      // surfaceContainerLow: Color(0xffe5e5e5), // Light surface container
      // surfaceContainer: Color(0xffeeeeee), // Standard light surface container
      // surfaceContainerHigh:
      //     Color(0xfff5f5f5), // High contrast light surface container
      // surfaceContainerHighest:
      //     Color(0xffffffff), // Highest contrast light surface container
    ));
