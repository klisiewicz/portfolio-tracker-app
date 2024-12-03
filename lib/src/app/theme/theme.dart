import 'package:flutter/material.dart';

ThemeData darkTheme() {
  return _theme(colorScheme: _darkColorScheme());
}

ThemeData lightTheme() {
  return _theme(colorScheme: _lightColorScheme());
}

ThemeData _theme({
  required ColorScheme colorScheme,
  TextTheme textTheme = const TextTheme(),
}) {
  return ThemeData(
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
}

ColorScheme _lightColorScheme() {
  return const ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xff3b6939),
    surfaceTint: Color(0xff3b6939),
    onPrimary: Color(0xffffffff),
    primaryContainer: Color(0xffbcf0b4),
    onPrimaryContainer: Color(0xff002204),
    secondary: Color(0xff785a0b),
    onSecondary: Color(0xffffffff),
    secondaryContainer: Color(0xffffdfa0),
    onSecondaryContainer: Color(0xff261a00),
    tertiary: Color(0xff735187),
    onTertiary: Color(0xffffffff),
    tertiaryContainer: Color(0xfff4d9ff),
    onTertiaryContainer: Color(0xff2b0b3f),
    error: Color(0xff904a45),
    onError: Color(0xffffffff),
    errorContainer: Color(0xffffdad6),
    onErrorContainer: Color(0xff3b0908),
    surface: Color(0xfff5fafb),
    onSurface: Color(0xff171d1e),
    onSurfaceVariant: Color(0xff3f484a),
    outline: Color(0xff6f797a),
    outlineVariant: Color(0xffbfc8ca),
    shadow: Color(0xff000000),
    scrim: Color(0xff000000),
    inverseSurface: Color(0xff2b3133),
    inversePrimary: Color(0xffa1d39a),
    primaryFixed: Color(0xffbcf0b4),
    onPrimaryFixed: Color(0xff002204),
    primaryFixedDim: Color(0xffa1d39a),
    onPrimaryFixedVariant: Color(0xff235024),
    secondaryFixed: Color(0xffffdfa0),
    onSecondaryFixed: Color(0xff261a00),
    secondaryFixedDim: Color(0xffeac16c),
    onSecondaryFixedVariant: Color(0xff5c4300),
    tertiaryFixed: Color(0xfff4d9ff),
    onTertiaryFixed: Color(0xff2b0b3f),
    tertiaryFixedDim: Color(0xffe0b8f6),
    onTertiaryFixedVariant: Color(0xff5a396e),
    surfaceDim: Color(0xffd5dbdc),
    surfaceBright: Color(0xfff5fafb),
    surfaceContainerLowest: Color(0xffffffff),
    surfaceContainerLow: Color(0xffeff5f6),
    surfaceContainer: Color(0xffe9eff0),
    surfaceContainerHigh: Color(0xffe3e9ea),
    surfaceContainerHighest: Color(0xffdee3e5),
  );
}

ColorScheme _darkColorScheme() {
  return const ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xffa1d39a),
    surfaceTint: Color(0xffa1d39a),
    onPrimary: Color(0xff0a390f),
    primaryContainer: Color(0xff235024),
    onPrimaryContainer: Color(0xffbcf0b4),
    secondary: Color(0xffeac16c),
    onSecondary: Color(0xff402d00),
    secondaryContainer: Color(0xff5c4300),
    onSecondaryContainer: Color(0xffffdfa0),
    tertiary: Color(0xffe0b8f6),
    onTertiary: Color(0xff422356),
    tertiaryContainer: Color(0xff5a396e),
    onTertiaryContainer: Color(0xfff4d9ff),
    error: Color(0xffffb3ac),
    onError: Color(0xff571e1a),
    errorContainer: Color(0xff73332f),
    onErrorContainer: Color(0xffffdad6),
    surface: Color(0xff0e1415),
    onSurface: Color(0xffdee3e5),
    onSurfaceVariant: Color(0xffbfc8ca),
    outline: Color(0xff899294),
    outlineVariant: Color(0xff3f484a),
    shadow: Color(0xff000000),
    scrim: Color(0xff000000),
    inverseSurface: Color(0xffdee3e5),
    inversePrimary: Color(0xff3b6939),
    primaryFixed: Color(0xffbcf0b4),
    onPrimaryFixed: Color(0xff002204),
    primaryFixedDim: Color(0xffa1d39a),
    onPrimaryFixedVariant: Color(0xff235024),
    secondaryFixed: Color(0xffffdfa0),
    onSecondaryFixed: Color(0xff261a00),
    secondaryFixedDim: Color(0xffeac16c),
    onSecondaryFixedVariant: Color(0xff5c4300),
    tertiaryFixed: Color(0xfff4d9ff),
    onTertiaryFixed: Color(0xff2b0b3f),
    tertiaryFixedDim: Color(0xffe0b8f6),
    onTertiaryFixedVariant: Color(0xff5a396e),
    surfaceDim: Color(0xff0e1415),
    surfaceBright: Color(0xff343a3b),
    surfaceContainerLowest: Color(0xff090f10),
    surfaceContainerLow: Color(0xff171d1e),
    surfaceContainer: Color(0xff1b2122),
    surfaceContainerHigh: Color(0xff252b2c),
    surfaceContainerHighest: Color(0xff303637),
  );
}
