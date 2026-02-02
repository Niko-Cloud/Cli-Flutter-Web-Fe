import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../parser/command_parser.dart';
import '../../utils/date_header_format.dart';
import 'terminal_line.dart';

class TerminalState {
  final List<TerminalLine> lines;
  final String currentInput;
  final List<String> history;
  final int historyIndex;
  final int cursorIndex;

  const TerminalState({
    required this.lines,
    required this.currentInput,
    required this.history,
    required this.historyIndex,
    required this.cursorIndex,
  });

  TerminalState copyWith({
    List<TerminalLine>? lines,
    String? currentInput,
    List<String>? history,
    int? historyIndex,
    int? cursorIndex,
  }) {
    return TerminalState(
      lines: lines ?? this.lines,
      currentInput: currentInput ?? this.currentInput,
      history: history ?? this.history,
      historyIndex: historyIndex ?? this.historyIndex,
      cursorIndex: cursorIndex ?? this.cursorIndex,
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
      cursorIndex: 0,
    );
  }

  void type(String value) {
    final input = state.currentInput;
    final i = state.cursorIndex;

    final updated = input.substring(0, i) + value + input.substring(i);

    state = state.copyWith(
      currentInput: updated,
      cursorIndex: _clampCursor(i + value.length, updated),
      historyIndex: -1,
    );
  }

  // submit
  void submit() {
    final input = state.currentInput.trim();

    // If input is empty, just add a new prompt line
    if (input.trim().isEmpty) {
      state = state.copyWith(
        lines: [
          ...state.lines,
          const TerminalLine(text: '\$', isCommand: true),
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
        cursorIndex: 0,
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
      cursorIndex: 0,
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
      cursorIndex: state.history[nextIndex].length,
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
      cursorIndex: 0,
    );
  }

  Future<void> paste(String text) async {
    if (text.isEmpty) return;

    final normalized = text.replaceAll('\r\n', '\n');
    final i = state.cursorIndex;
    final input = state.currentInput;

    final updated = input.substring(0, i) + normalized + input.substring(i);

    state = state.copyWith(
      currentInput: updated,
      cursorIndex: _clampCursor(i + normalized.length, updated),
      historyIndex: -1,
    );
  }

  // Delete with Backspace Key middle cursor
  void backspace() {
    final i = state.cursorIndex;
    final input = state.currentInput;

    if (i <= 0) return;

    final updated = input.substring(0, i - 1) + input.substring(i);

    state = state.copyWith(
      currentInput: updated,
      cursorIndex: _clampCursor(i - 1, updated),
      historyIndex: -1,
    );
  }

  // Middle Text Editing with arrow Keys
  void moveCursorLeft() {
    if (state.cursorIndex <= 0) return;

    state = state.copyWith(cursorIndex: state.cursorIndex - 1);
  }

  void moveCursorRight() {
    if (state.cursorIndex >= state.currentInput.length) return;

    state = state.copyWith(cursorIndex: state.cursorIndex + 1);
  }
}

int _clampCursor(int cursor, String input) {
  if (cursor < 0) return 0;
  if (cursor > input.length) return input.length;
  return cursor;
}

final terminalProvider = NotifierProvider<TerminalNotifier, TerminalState>(
  TerminalNotifier.new,
);
