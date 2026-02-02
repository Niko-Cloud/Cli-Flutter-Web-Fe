import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../theme/terminal_text.dart';
import '../controller/terminal_notifier.dart';
import 'blinking_cursor.dart';

class TerminalOutput extends ConsumerStatefulWidget {
  const TerminalOutput({super.key});

  @override
  ConsumerState<TerminalOutput> createState() => _TerminalOutputState();
}

class _TerminalOutputState extends ConsumerState<TerminalOutput> {
  final ScrollController _scrollController = ScrollController();

  bool _autoScrollEnabled = true;
  String _lastInput = '';

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      final max = _scrollController.position.maxScrollExtent;
      final offset = _scrollController.offset;

      _autoScrollEnabled = (max - offset) < 20;
    });
  }

  @override
  Widget build(BuildContext context) {
    final terminal = ref.watch(terminalProvider);

    // detect input change
    final bool inputChanged =
        terminal.currentInput != _lastInput;
    _lastInput = terminal.currentInput;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_scrollController.hasClients) return;

      // typing input scroll
      if (inputChanged) {
        _scrollController.jumpTo(
          _scrollController.position.maxScrollExtent,
        );
        return;
      }

      // auto-scrol
      if (_autoScrollEnabled) {
        _scrollController.jumpTo(
          _scrollController.position.maxScrollExtent,
        );
      }
    });

    final input = terminal.currentInput;
    final i = terminal.cursorIndex;

    final before = input.substring(0, i);
    final after = input.substring(i);

    return DefaultTextStyle(
      style: TerminalText.base.copyWith(
        fontFamily: 'JetBrainsMono',
      ),
      child: SelectionArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(14, 10, 14, 10),
          child: ListView(
            controller: _scrollController,
            children: [
              for (final line in terminal.lines)
                Text(
                  line.text,
                  style: line.isCommand
                      ? TerminalText.accent
                      : TerminalText.base,
                ),

              Row(
                children: [
                  Text('\$ ', style: TerminalText.accent),
                  Text(before, style: TerminalText.base),
                  const BlinkingCursor(),
                  Text(after, style: TerminalText.base),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

