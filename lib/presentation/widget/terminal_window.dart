import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../theme/terminal_color_scheme.dart';
import '../controller/terminal_notifier.dart';
import 'terminal_header.dart';
import 'terminal_output.dart';

class TerminalWindow extends ConsumerStatefulWidget {
  const TerminalWindow({super.key});

  @override
  ConsumerState<TerminalWindow> createState() => _TerminalWindowState();
}

class _TerminalWindowState extends ConsumerState<TerminalWindow> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardListener(
      focusNode: _focusNode,
      onKeyEvent: (event) {
        if (event is KeyDownEvent) {
          final notifier = ref.read(terminalProvider.notifier);

          if (event.logicalKey == LogicalKeyboardKey.enter) {
            notifier.submit();
          } else if (event.logicalKey == LogicalKeyboardKey.backspace) {
            final input = ref.read(terminalProvider).currentInput;
            if (input.isNotEmpty) {
              notifier.type(input.substring(0, input.length - 1));
            }
          } else if (event.character != null && event.character!.isNotEmpty) {
            notifier.type(
              ref.read(terminalProvider).currentInput + event.character!,
            );
          }
        }
      },
      child: Container(
        width: 1200,
        height: 720,
        decoration: BoxDecoration(
          color: TerminalColors.background,
          borderRadius: BorderRadius.circular(12),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Column(
            children: const [
              TerminalHeader(),
              Expanded(child: TerminalOutput()),
            ],
          ),
        ),
      ),
    );
  }
}
