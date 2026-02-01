import 'package:flutter/material.dart';

import '../../theme/terminal_text.dart';

class BlinkingCursor extends StatefulWidget {
  const BlinkingCursor({super.key});

  @override
  State<BlinkingCursor> createState() => _BlinkingCursorState();
}

class _BlinkingCursorState extends State<BlinkingCursor> {
  bool visible = true;

  @override
  void initState() {
    super.initState();
    Future.doWhile(() async {
      await Future.delayed(const Duration(milliseconds: 500));
      setState(() => visible = !visible);
      return mounted;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      visible ? '|' : ' ',
      style: TerminalText.base,
    );
  }
}
