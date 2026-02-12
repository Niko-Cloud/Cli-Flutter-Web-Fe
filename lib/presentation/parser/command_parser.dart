import 'package:cli_web/presentation/parser/command_help_parser.dart';
import 'package:cli_web/presentation/parser/command_showcase_parser.dart';

import 'command_result.dart';
import 'command_whoami_parser.dart';

Future<CommandResult> parseCommand(String input) async {
  final parts = input.trim().split(RegExp(r'\s+'));
  final cmd = parts.first.toLowerCase();
  final args = parts.skip(1).toList();

  switch (cmd) {
    case 'help':
      return handleHelp(args);

    // case 'whoami':
    //   return handleWhoami();
    //
    // case 'skills':
    //   return const CommandResult(
    //     output: ['Flutter', 'Dart', 'Firebase', 'REST API'],
    //   );
    //
    // case 'showcase':
    //   return handleShowcase(args);
    //
    // case 'contact':
    //   return const CommandResult(
    //     output: [
    //       'Email: you@email.com',
    //       'GitHub: github.com/you',
    //       'LinkedIn: linkedin.com/in/you',
    //     ],
    //   );
    //
    case 'clear':
      return const CommandResult(clear: true);

    default:
      return CommandResult(
        output: [
          'command not found: $cmd',
          'Type HELP to see available commands.',
        ],
      );
  }
}
