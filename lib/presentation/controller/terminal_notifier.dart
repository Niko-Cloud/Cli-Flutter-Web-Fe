import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utils/command_parser.dart';
import '../../utils/date_header_format.dart';
import 'terminal_line.dart';

class TerminalState {
  final List<TerminalLine> lines;
  final String currentInput;
  final List<String> history;
  final int historyIndex;

  const TerminalState({
    required this.lines,
    required this.currentInput,
    required this.history,
    required this.historyIndex,
  });

  TerminalState copyWith({
    List<TerminalLine>? lines,
    String? currentInput,
    List<String>? history,
    int? historyIndex,
  }) {
    return TerminalState(
      lines: lines ?? this.lines,
      currentInput: currentInput ?? this.currentInput,
      history: history ?? this.history,
      historyIndex: historyIndex ?? this.historyIndex,
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
      history: const [],
      historyIndex: -1,
    );
  }

  void type(String value) {
    state = state.copyWith(currentInput: value, historyIndex: -1);
  }


  // submit
  void submit() {
    final input = state.currentInput.trim();

    // If input is empty, just add a new prompt line
    if (input.trim().isEmpty) {
      state = state.copyWith(
        lines: [
          ...state.lines,
          const TerminalLine(
            text: '\$',
            isCommand: true,
          ),
        ],
        currentInput: '',
        historyIndex: -1,
      );
      return;
    }

    final newLines = [
      ...state.lines,
      TerminalLine(text: '\$ $input', isCommand: true),
    ];

    final result = parseCommand(input);

    if (result.clear) {
      state = TerminalState(
        lines: const [],
        currentInput: '',
        history: [...state.history, input],
        historyIndex: -1,
      );
      return;
    }

    for (final line in result.output) {
      newLines.add(TerminalLine(text: line));
    }

    state = TerminalState(
      lines: newLines,
      currentInput: '',
      history: [...state.history, input],
      historyIndex: -1,
    );
  }

  // ArrowUp
  void previousCommand() {
    if (state.history.isEmpty) return;

    final nextIndex = state.historyIndex < 0
        ? state.history.length - 1
        : state.historyIndex - 1;

    if (nextIndex < 0) return;

    state = state.copyWith(
      historyIndex: nextIndex,
      currentInput: state.history[nextIndex],
    );
  }

  // ArrowDown
  void nextCommand() {
    if (state.history.isEmpty || state.historyIndex == -1) {
      return;
    }

    final nextIndex = state.historyIndex + 1;

    if (nextIndex >= state.history.length) {
      state = state.copyWith(historyIndex: -1, currentInput: '');
      return;
    }

    state = state.copyWith(
      historyIndex: nextIndex,
      currentInput: state.history[nextIndex],
    );
  }
}

final terminalProvider = NotifierProvider<TerminalNotifier, TerminalState>(
  TerminalNotifier.new,
);
