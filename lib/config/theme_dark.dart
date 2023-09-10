import "package:flutter/material.dart";
import "package:wayo/config/theme_all.dart";

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFF4DD9E5),
  onPrimary: Color(0xFF00363B),
  primaryContainer: Color(0xFF004F55),
  onPrimaryContainer: Color(0xFF80F4FF),
  secondary: Color(0xFF93CCFF),
  onSecondary: Color(0xFF003351),
  secondaryContainer: Color(0xFF004B74),
  onSecondaryContainer: Color(0xFFCDE5FF),
  tertiary: Color(0xFF98CBFF),
  onTertiary: Color(0xFF003354),
  tertiaryContainer: Color(0xFF004A77),
  onTertiaryContainer: Color(0xFFCEE5FF),
  error: Color(0xFFFFB4AB),
  errorContainer: Color(0xFF93000A),
  onError: Color(0xFF690005),
  onErrorContainer: Color(0xFFFFDAD6),
  background: Color(0xFF191C1D),
  onBackground: Color(0xFFE0E3E3),
  surface: Color(0xFF191C1D),
  onSurface: Color(0xFFE0E3E3),
  surfaceVariant: Color(0xFF3F4849),
  onSurfaceVariant: Color(0xFFBEC8C9),
  outline: Color(0xFF899393),
  onInverseSurface: Color(0xFF191C1D),
  inverseSurface: Color(0xFFE0E3E3),
  inversePrimary: Color(0xFF006970),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF4DD9E5),
  outlineVariant: Color(0xFF3F4849),
  scrim: Color(0xFF000000),
);

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  fontFamily: "Inter",
  brightness: Brightness.dark,
  colorScheme: darkColorScheme,
  appBarTheme: appBarTheme,
  bottomAppBarTheme: bottomAppBarTheme,
  cardTheme: cardTheme,
  tabBarTheme: tabBarTheme,
);
