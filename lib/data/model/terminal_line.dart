enum TerminalLineType {
  input,
  output,
  error,
}

class TerminalLine {
  final String text;
  final TerminalLineType type;

  const TerminalLine(this.text, this.type);
}
