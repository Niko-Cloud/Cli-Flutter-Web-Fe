import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../theme/terminal_text.dart';
import '../controller/terminal_notifier.dart';
import 'blinking_cursor.dart';

class TerminalOutput extends ConsumerWidget {
  const TerminalOutput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final terminal = ref.watch(terminalProvider);

    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 10, 14, 10),
      child: ListView(
        children: [
          for (final line in terminal.lines)
            SelectableText(
              line.text,
              style: line.isCommand
                  ? TerminalText.accent
                  : TerminalText.base,
            ),

          Row(
            children: [
              Text('\$ ', style: TerminalText.accent),
              Text(
                terminal.currentInput,
                style: TerminalText.base,
              ),
              const BlinkingCursor(),
            ],
          ),
        ],
      ),
    );
  }
}
