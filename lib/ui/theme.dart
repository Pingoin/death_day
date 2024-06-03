import "package:flutter/material.dart";

class DeathDayTheme {
  final TextTheme textTheme;

  const DeathDayTheme(this.textTheme);

  static MaterialScheme lightScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff2f324f),
      surfaceTint: Color(0xff595c7b),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff515473),
      onPrimaryContainer: Color(0xfffefaff),
      secondary: Color(0xff5d5d6b),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffe3e2f2),
      onSecondaryContainer: Color(0xff474855),
      tertiary: Color(0xff735c00),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffbc9916),
      onTertiaryContainer: Color(0xff140e00),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      background: Color(0xfffcf8fb),
      onBackground: Color(0xff1c1b1e),
      surface: Color(0xfffcf8fb),
      onSurface: Color(0xff1c1b1e),
      surfaceVariant: Color(0xffe4e1ea),
      onSurfaceVariant: Color(0xff46464d),
      outline: Color(0xff77767e),
      outlineVariant: Color(0xffc7c5ce),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff313032),
      inverseOnSurface: Color(0xfff3f0f3),
      inversePrimary: Color(0xffc2c4e8),
      primaryFixed: Color(0xffdfe0ff),
      onPrimaryFixed: Color(0xff161935),
      primaryFixedDim: Color(0xffc2c4e8),
      onPrimaryFixedVariant: Color(0xff424563),
      secondaryFixed: Color(0xffe2e1f1),
      onSecondaryFixed: Color(0xff1a1b26),
      secondaryFixedDim: Color(0xffc6c5d5),
      onSecondaryFixedVariant: Color(0xff454653),
      tertiaryFixed: Color(0xffffe085),
      onTertiaryFixed: Color(0xff231b00),
      tertiaryFixedDim: Color(0xffe9c342),
      onTertiaryFixedVariant: Color(0xff574500),
      surfaceDim: Color(0xffdcd9dc),
      surfaceBright: Color(0xfffcf8fb),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff6f2f5),
      surfaceContainer: Color(0xfff0edf0),
      surfaceContainerHigh: Color(0xffebe7ea),
      surfaceContainerHighest: Color(0xffe5e1e4),
    );
  }

  ThemeData light() {
    return theme(lightScheme().toColorScheme());
  }

  static MaterialScheme lightMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff2f324f),
      surfaceTint: Color(0xff595c7b),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff515473),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff41424f),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff737382),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff524100),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff8d7100),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8c0009),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffda342e),
      onErrorContainer: Color(0xffffffff),
      background: Color(0xfffcf8fb),
      onBackground: Color(0xff1c1b1e),
      surface: Color(0xfffcf8fb),
      onSurface: Color(0xff1c1b1e),
      surfaceVariant: Color(0xffe4e1ea),
      onSurfaceVariant: Color(0xff424249),
      outline: Color(0xff5f5e66),
      outlineVariant: Color(0xff7b7a82),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff313032),
      inverseOnSurface: Color(0xfff3f0f3),
      inversePrimary: Color(0xffc2c4e8),
      primaryFixed: Color(0xff707293),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff575a79),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff737382),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff5a5b69),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff8d7100),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff705900),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffdcd9dc),
      surfaceBright: Color(0xfffcf8fb),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff6f2f5),
      surfaceContainer: Color(0xfff0edf0),
      surfaceContainerHigh: Color(0xffebe7ea),
      surfaceContainerHighest: Color(0xffe5e1e4),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme lightHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff1d203c),
      surfaceTint: Color(0xff595c7b),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff3e415e),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff20212d),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff41424f),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff2b2100),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff524100),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0xffffffff),
      background: Color(0xfffcf8fb),
      onBackground: Color(0xff1c1b1e),
      surface: Color(0xfffcf8fb),
      onSurface: Color(0xff000000),
      surfaceVariant: Color(0xffe4e1ea),
      onSurfaceVariant: Color(0xff23232a),
      outline: Color(0xff424249),
      outlineVariant: Color(0xff424249),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff313032),
      inverseOnSurface: Color(0xffffffff),
      inversePrimary: Color(0xffebeaff),
      primaryFixed: Color(0xff3e415e),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff272a47),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff41424f),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff2b2c38),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff524100),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff382b00),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffdcd9dc),
      surfaceBright: Color(0xfffcf8fb),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff6f2f5),
      surfaceContainer: Color(0xfff0edf0),
      surfaceContainerHigh: Color(0xffebe7ea),
      surfaceContainerHighest: Color(0xffe5e1e4),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme().toColorScheme());
  }

  static MaterialScheme darkScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xffc2c4e8),
      surfaceTint: Color(0xffc2c4e8),
      onPrimary: Color(0xff2b2e4b),
      primaryContainer: Color(0xff393c59),
      onPrimaryContainer: Color(0xffcdcff4),
      secondary: Color(0xffc6c5d5),
      onSecondary: Color(0xff2f2f3c),
      secondaryContainer: Color(0xff3c3d49),
      onSecondaryContainer: Color(0xffd1d0e0),
      tertiary: Color(0xffe9c342),
      onTertiary: Color(0xff3c2f00),
      tertiaryContainer: Color(0xff8d7100),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      background: Color(0xff131315),
      onBackground: Color(0xffe5e1e4),
      surface: Color(0xff131315),
      onSurface: Color(0xffe5e1e4),
      surfaceVariant: Color(0xff46464d),
      onSurfaceVariant: Color(0xffc7c5ce),
      outline: Color(0xff919098),
      outlineVariant: Color(0xff46464d),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe5e1e4),
      inverseOnSurface: Color(0xff313032),
      inversePrimary: Color(0xff595c7b),
      primaryFixed: Color(0xffdfe0ff),
      onPrimaryFixed: Color(0xff161935),
      primaryFixedDim: Color(0xffc2c4e8),
      onPrimaryFixedVariant: Color(0xff424563),
      secondaryFixed: Color(0xffe2e1f1),
      onSecondaryFixed: Color(0xff1a1b26),
      secondaryFixedDim: Color(0xffc6c5d5),
      onSecondaryFixedVariant: Color(0xff454653),
      tertiaryFixed: Color(0xffffe085),
      onTertiaryFixed: Color(0xff231b00),
      tertiaryFixedDim: Color(0xffe9c342),
      onTertiaryFixedVariant: Color(0xff574500),
      surfaceDim: Color(0xff131315),
      surfaceBright: Color(0xff39393b),
      surfaceContainerLowest: Color(0xff0e0e10),
      surfaceContainerLow: Color(0xff1c1b1e),
      surfaceContainer: Color(0xff201f22),
      surfaceContainerHigh: Color(0xff2a2a2c),
      surfaceContainerHighest: Color(0xff353437),
    );
  }

  ThemeData dark() {
    return theme(darkScheme().toColorScheme());
  }

  static MaterialScheme darkMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xffc6c8ec),
      surfaceTint: Color(0xffc2c4e8),
      onPrimary: Color(0xff11142f),
      primaryContainer: Color(0xff8c8eb0),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffcac9d9),
      onSecondary: Color(0xff141521),
      secondaryContainer: Color(0xff908f9e),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffeec746),
      onTertiary: Color(0xff1d1500),
      tertiaryContainer: Color(0xffaf8d00),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      background: Color(0xff131315),
      onBackground: Color(0xffe5e1e4),
      surface: Color(0xff131315),
      onSurface: Color(0xfffdfafd),
      surfaceVariant: Color(0xff46464d),
      onSurfaceVariant: Color(0xffccc9d2),
      outline: Color(0xffa3a2aa),
      outlineVariant: Color(0xff83828a),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe5e1e4),
      inverseOnSurface: Color(0xff2a2a2c),
      inversePrimary: Color(0xff434664),
      primaryFixed: Color(0xffdfe0ff),
      onPrimaryFixed: Color(0xff0b0e2a),
      primaryFixedDim: Color(0xffc2c4e8),
      onPrimaryFixedVariant: Color(0xff313451),
      secondaryFixed: Color(0xffe2e1f1),
      onSecondaryFixed: Color(0xff0f101b),
      secondaryFixedDim: Color(0xffc6c5d5),
      onSecondaryFixedVariant: Color(0xff343542),
      tertiaryFixed: Color(0xffffe085),
      onTertiaryFixed: Color(0xff171000),
      tertiaryFixedDim: Color(0xffe9c342),
      onTertiaryFixedVariant: Color(0xff433500),
      surfaceDim: Color(0xff131315),
      surfaceBright: Color(0xff39393b),
      surfaceContainerLowest: Color(0xff0e0e10),
      surfaceContainerLow: Color(0xff1c1b1e),
      surfaceContainer: Color(0xff201f22),
      surfaceContainerHigh: Color(0xff2a2a2c),
      surfaceContainerHighest: Color(0xff353437),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme darkHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffdf9ff),
      surfaceTint: Color(0xffc2c4e8),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffc6c8ec),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffdf9ff),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffcac9d9),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfffffaf6),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffeec746),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      background: Color(0xff131315),
      onBackground: Color(0xffe5e1e4),
      surface: Color(0xff131315),
      onSurface: Color(0xffffffff),
      surfaceVariant: Color(0xff46464d),
      onSurfaceVariant: Color(0xfffdf9ff),
      outline: Color(0xffccc9d2),
      outlineVariant: Color(0xffccc9d2),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe5e1e4),
      inverseOnSurface: Color(0xff000000),
      inversePrimary: Color(0xff252844),
      primaryFixed: Color(0xffe5e5ff),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffc6c8ec),
      onPrimaryFixedVariant: Color(0xff11142f),
      secondaryFixed: Color(0xffe7e5f6),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffcac9d9),
      onSecondaryFixedVariant: Color(0xff141521),
      tertiaryFixed: Color(0xffffe59c),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffeec746),
      onTertiaryFixedVariant: Color(0xff1d1500),
      surfaceDim: Color(0xff131315),
      surfaceBright: Color(0xff39393b),
      surfaceContainerLowest: Color(0xff0e0e10),
      surfaceContainerLow: Color(0xff1c1b1e),
      surfaceContainer: Color(0xff201f22),
      surfaceContainerHigh: Color(0xff2a2a2c),
      surfaceContainerHighest: Color(0xff353437),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme().toColorScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.surface,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class MaterialScheme {
  const MaterialScheme({
    required this.brightness,
    required this.primary, 
    required this.surfaceTint, 
    required this.onPrimary, 
    required this.primaryContainer, 
    required this.onPrimaryContainer, 
    required this.secondary, 
    required this.onSecondary, 
    required this.secondaryContainer, 
    required this.onSecondaryContainer, 
    required this.tertiary, 
    required this.onTertiary, 
    required this.tertiaryContainer, 
    required this.onTertiaryContainer, 
    required this.error, 
    required this.onError, 
    required this.errorContainer, 
    required this.onErrorContainer, 
    required this.background, 
    required this.onBackground, 
    required this.surface, 
    required this.onSurface, 
    required this.surfaceVariant, 
    required this.onSurfaceVariant, 
    required this.outline, 
    required this.outlineVariant, 
    required this.shadow, 
    required this.scrim, 
    required this.inverseSurface, 
    required this.inverseOnSurface, 
    required this.inversePrimary, 
    required this.primaryFixed, 
    required this.onPrimaryFixed, 
    required this.primaryFixedDim, 
    required this.onPrimaryFixedVariant, 
    required this.secondaryFixed, 
    required this.onSecondaryFixed, 
    required this.secondaryFixedDim, 
    required this.onSecondaryFixedVariant, 
    required this.tertiaryFixed, 
    required this.onTertiaryFixed, 
    required this.tertiaryFixedDim, 
    required this.onTertiaryFixedVariant, 
    required this.surfaceDim, 
    required this.surfaceBright, 
    required this.surfaceContainerLowest, 
    required this.surfaceContainerLow, 
    required this.surfaceContainer, 
    required this.surfaceContainerHigh, 
    required this.surfaceContainerHighest, 
  });

  final Brightness brightness;
  final Color primary;
  final Color surfaceTint;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color surfaceVariant;
  final Color onSurfaceVariant;
  final Color outline;
  final Color outlineVariant;
  final Color shadow;
  final Color scrim;
  final Color inverseSurface;
  final Color inverseOnSurface;
  final Color inversePrimary;
  final Color primaryFixed;
  final Color onPrimaryFixed;
  final Color primaryFixedDim;
  final Color onPrimaryFixedVariant;
  final Color secondaryFixed;
  final Color onSecondaryFixed;
  final Color secondaryFixedDim;
  final Color onSecondaryFixedVariant;
  final Color tertiaryFixed;
  final Color onTertiaryFixed;
  final Color tertiaryFixedDim;
  final Color onTertiaryFixedVariant;
  final Color surfaceDim;
  final Color surfaceBright;
  final Color surfaceContainerLowest;
  final Color surfaceContainerLow;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;
  final Color surfaceContainerHighest;
}

extension MaterialSchemeUtils on MaterialScheme {
  ColorScheme toColorScheme() {
    return ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      secondary: secondary,
      onSecondary: onSecondary,
      secondaryContainer: secondaryContainer,
      onSecondaryContainer: onSecondaryContainer,
      tertiary: tertiary,
      onTertiary: onTertiary,
      tertiaryContainer: tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer,
      error: error,
      onError: onError,
      errorContainer: errorContainer,
      onErrorContainer: onErrorContainer,
      surface: surface,
      onSurface: onSurface,
      surfaceContainerHighest: surfaceVariant,
      onSurfaceVariant: onSurfaceVariant,
      outline: outline,
      outlineVariant: outlineVariant,
      shadow: shadow,
      scrim: scrim,
      inverseSurface: inverseSurface,
      onInverseSurface: inverseOnSurface,
      inversePrimary: inversePrimary,
    );
  }
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
