import 'package:cli_web/utils/date_header_format.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../utils/command_parser.dart';
import '../../utils/command_result.dart';
import 'terminal_line.dart';

class TerminalState {
  final List<TerminalLine> lines;
  final String currentInput;

  const TerminalState({
    required this.lines,
    required this.currentInput,
  });

  TerminalState copyWith({
    List<TerminalLine>? lines,
    String? currentInput,
  }) {
    return TerminalState(
      lines: lines ?? this.lines,
      currentInput: currentInput ?? this.currentInput,
    );
  }
}

class TerminalNotifier extends Notifier<TerminalState> {
  @override
  TerminalState build() {
    return TerminalState(
      lines: [
        TerminalLine(
          text: 'Last login: ${DateHeaderFormat.dateHeaderFormat} on web',
        ),
      ],
      currentInput: '',
    );
  }

  void type(String value) {
    state = state.copyWith(currentInput: value);
  }

  void submit() {
    final input = state.currentInput.trim();
    if (input.isEmpty) return;

    final newLines = [
      ...state.lines,
      TerminalLine(
        text: '\$ $input',
        isCommand: true,
      ),
    ];

    final CommandResult result = parseCommand(input);

    if (result.clear) {
      state = const TerminalState(
        lines: [],
        currentInput: '',
      );
      return;
    }

    for (final line in result.output) {
      newLines.add(
        TerminalLine(text: line),
      );
    }

    state = TerminalState(
      lines: newLines,
      currentInput: '',
    );
  }
}

final terminalProvider =
NotifierProvider<TerminalNotifier, TerminalState>(
  TerminalNotifier.new,
);