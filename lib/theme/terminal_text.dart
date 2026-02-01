import 'package:flutter/material.dart';
import 'terminal_color_scheme.dart';

class TerminalText {
  static TextStyle base = const TextStyle(
    fontFamily: 'JetBrainsMono',
    fontSize: 14,
    color: TerminalColors.text,
    height: 1.5,
  );

  static TextStyle accent =
  base.copyWith(color: TerminalColors.accent);
}
