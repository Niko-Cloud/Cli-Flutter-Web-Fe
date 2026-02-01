import 'package:cli_web/presentation/widget/terminal_window.dart';
import 'package:flutter/material.dart';

class TerminalScreen extends StatelessWidget {
  const TerminalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.png',
              repeat: ImageRepeat.repeat,
              scale: 3,
            ),
          ),

          Positioned.fill(
            child: Container(
              color: Colors.black.withValues(alpha: 0.6),
            ),
          ),

          const Center(
            child: TerminalWindow(),
          ),
        ],
      ),
    );
  }
}
