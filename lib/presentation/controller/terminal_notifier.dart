import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'terminal_line.dart';

class TerminalState {
  final List<TerminalLine> lines;
  final String currentInput;

  const TerminalState({required this.lines, required this.currentInput});

  TerminalState copyWith({List<TerminalLine>? lines, String? currentInput}) {
    return TerminalState(
      lines: lines ?? this.lines,
      currentInput: currentInput ?? this.currentInput,
    );
  }
}

class TerminalNotifier extends Notifier<TerminalState> {
  @override
  TerminalState build() {
    return const TerminalState(
      lines: [TerminalLine(text: 'Last login: Fri Jan 26 21:32:10 on web')],
      currentInput: '',
    );
  }

  void type(String value) {
    state = state.copyWith(currentInput: value);
  }

  void submit() {
    if (state.currentInput.trim().isEmpty) return;

    final updatedLines = [
      ...state.lines,
      TerminalLine(text: '\$ ${state.currentInput}', isCommand: true),
    ];

    state = TerminalState(lines: updatedLines, currentInput: '');
  }
}

final terminalProvider = NotifierProvider<TerminalNotifier, TerminalState>(
  TerminalNotifier.new,
);
