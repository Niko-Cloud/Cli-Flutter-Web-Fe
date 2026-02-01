import 'package:flutter/material.dart';
import '../../theme/terminal_text.dart';
import 'blinking_cursor.dart';

class TerminalOutput extends StatelessWidget {
  const TerminalOutput({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 10, 14, 10),
      child: ListView(
        children: [
          SelectableText(
            'Last login: Fri Jan 26 21:32:10 on web',
            style: TerminalText.base,
          ),

          SelectableText(
            '\$ whoami',
            style: TerminalText.accent,
          ),
          SelectableText(
            'Flutter Developer',
            style: TerminalText.base,
          ),

          SelectableText(
            '\$ help',
            style: TerminalText.accent,
          ),
          SelectableText(
            'whoami skills showcase contact clear',
            style: TerminalText.base,
          ),

          Row(
            children: [
              Text('\$ ', style: TerminalText.accent),
              const BlinkingCursor(),
            ],
          ),
        ],
      ),
    );
  }
}
