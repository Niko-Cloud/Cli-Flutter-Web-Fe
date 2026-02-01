import 'package:flutter/material.dart';
import 'terminal_color_scheme.dart';

class TerminalTheme {
  static ThemeData dark() {
    return ThemeData(
      scaffoldBackgroundColor: TerminalColors.background,
      brightness: Brightness.dark,
      fontFamily: 'JetBrainsMono',
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: TerminalColors.text,
        selectionColor: TerminalColors.accent,
      ),
    );
  }
}
