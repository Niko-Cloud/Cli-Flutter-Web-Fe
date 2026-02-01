import 'package:cli_web/presentation/terminal/terminal_screen.dart';
import 'package:flutter/material.dart';
import 'theme/terminal_theme.dart';

class CliApp extends StatelessWidget {
  const CliApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CLI Portfolio',
      debugShowCheckedModeBanner: false,
      theme: TerminalTheme.dark(),
      home: const TerminalScreen(),
    );
  }
}
