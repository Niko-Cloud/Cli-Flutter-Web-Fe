import 'package:cli_web/presentation/parser/command_contact_parser.dart';
import 'package:cli_web/presentation/parser/command_education_parser.dart';
import 'package:cli_web/presentation/parser/command_help_parser.dart';
import 'package:cli_web/presentation/parser/command_showcase_parser.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'command_result.dart';
import 'command_whoami_parser.dart';

Future<CommandResult> parseCommand(Ref ref, String input) async {
  final parts = input.trim().split(RegExp(r'\s+'));
  final cmd = parts.first.toLowerCase();
  final args = parts.skip(1).toList();

  switch (cmd) {
    case 'help':
      return handleHelp(ref, args);

    case 'whoami':
      return handleWhoami(ref);

    case 'contact':
      return handleContact(ref);

    case 'education':
      return handleEducation(ref);

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
