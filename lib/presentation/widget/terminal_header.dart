import 'package:cli_web/theme/terminal_color_scheme.dart';
import 'package:flutter/material.dart';

class TerminalHeader extends StatelessWidget {
  const TerminalHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            TerminalHeaderGradients.gradient1,
            TerminalHeaderGradients.gradient2,
          ],
        ),
        border: Border(
          bottom: BorderSide(
            color: Colors.white.withValues(alpha: 0.06),
          ),
        ),
      ),
      child: Row(
        children: const [
          _MacTrafficLights(),
          Spacer(),
          Text(
            'yuki hime — zsh',
            style: TextStyle(
              fontSize: 12,
              color: Colors.white70,
              fontFamily: 'JetBrainsMono',
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}

class _MacTrafficLights extends StatelessWidget {
  const _MacTrafficLights();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        _MacDot(color: TerminalTrafficLightColors.red),
        SizedBox(width: 8),
        _MacDot(color: TerminalTrafficLightColors.yellow),
        SizedBox(width: 8),
        _MacDot(color: TerminalTrafficLightColors.green),
      ],
    );
  }
}

class _MacDot extends StatefulWidget {
  final Color color;
  const _MacDot({required this.color});

  @override
  State<_MacDot> createState() => _MacDotState();
}

class _MacDotState extends State<_MacDot> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => hover = true),
      onExit: (_) => setState(() => hover = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: 12,
        height: 12,
        decoration: BoxDecoration(
          color: widget.color,
          shape: BoxShape.circle,
          boxShadow: hover
              ? [
            BoxShadow(
              color: widget.color.withValues(alpha: 0.6),
              blurRadius: 6,
            ),
          ]
              : null,
        ),
      ),
    );
  }
}
