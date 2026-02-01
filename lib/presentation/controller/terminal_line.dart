class TerminalLine {
  final String text;
  final bool isCommand;

  const TerminalLine({
    required this.text,
    this.isCommand = false,
  });
}
