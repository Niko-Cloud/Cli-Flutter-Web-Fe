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
        if (event is! KeyDownEvent && event is !KeyRepeatEvent) {
          return;
        }

        final notifier = ref.read(terminalProvider.notifier);
        final state = ref.read(terminalProvider);

        final isPaste = (event.logicalKey == LogicalKeyboardKey.keyV) &&
            (HardwareKeyboard.instance.isMetaPressed ||
                HardwareKeyboard.instance.isControlPressed);

        if (isPaste) {
          final data = await Clipboard.getData(Clipboard.kTextPlain);
          if (data?.text != null) {
            notifier.paste(data!.text!);
          }
          return;
        }

        switch (event.logicalKey) {
          case LogicalKeyboardKey.enter:
            notifier.submit();
            break;

          case LogicalKeyboardKey.arrowLeft:
            notifier.moveCursorLeft();
            break;

          case LogicalKeyboardKey.arrowRight:
            notifier.moveCursorRight();
            break;

          case LogicalKeyboardKey.arrowUp:
            notifier.previousCommand();
            break;

          case LogicalKeyboardKey.arrowDown:
            notifier.nextCommand();
            break;

          case LogicalKeyboardKey.backspace:
            notifier.backspace();
            break;

          default:
            if (event.character != null &&
                event.character!.isNotEmpty &&
                event.character != '\n') {
              notifier.type(event.character!);
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
