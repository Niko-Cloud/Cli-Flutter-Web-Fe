import 'package:cli_web/presentation/widget/terminal_output.dart';
import 'package:flutter/material.dart';
import '../../theme/terminal_color_scheme.dart';
import 'terminal_header.dart';

class TerminalWindow extends StatelessWidget {
  const TerminalWindow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1000,
      height: 700,
      decoration: BoxDecoration(
        color: TerminalColors.background,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.08),
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black87,
            blurRadius: 30,
            offset: Offset(0, 20),
          ),
        ],
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
    );
  }
}
