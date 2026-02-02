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
      onKeyEvent: (event) async {
        if (event is! KeyDownEvent) return;

        final notifier = ref.read(terminalProvider.notifier);
        final state = ref.read(terminalProvider);

        final isPaste =
            (event.logicalKey == LogicalKeyboardKey.keyV) &&
            (HardwareKeyboard.instance.isMetaPressed ||
                HardwareKeyboard.instance.isControlPressed);

        if (isPaste) {
          final clipboardData = await Clipboard.getData(Clipboard.kTextPlain);

          if (clipboardData?.text != null) {
            notifier.paste(clipboardData!.text!);
          }
          return;
        }

        if (event.logicalKey == LogicalKeyboardKey.enter) {
          notifier.submit();
        } else if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
          notifier.previousCommand();
        } else if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
          notifier.nextCommand();
        } else if (event.logicalKey == LogicalKeyboardKey.backspace) {
          if (state.currentInput.isNotEmpty) {
            notifier.type(
              state.currentInput.substring(0, state.currentInput.length - 1),
            );
          }
        } else if (event.character != null && event.character!.isNotEmpty) {
          notifier.type(state.currentInput + event.character!);
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
