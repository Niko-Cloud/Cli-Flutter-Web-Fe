import 'package:flutter/material.dart';

import '../../theme/terminal_text.dart';
import 'blinking_cursor.dart';

class TerminalPrompt extends StatelessWidget {
  const TerminalPrompt({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Text('\$ ', style: TerminalText.accent),
          BlinkingCursor(),
        ],
      ),
    );
  }
}
