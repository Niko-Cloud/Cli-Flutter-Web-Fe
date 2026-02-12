import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../provider/command_provider.dart';
import 'command_result.dart';

Future<CommandResult> handleHelp(Ref ref, List<String> args) async {
  // HELP (GENERAL)

  final commands = await ref.read(commandListProvider.future);

  if (args.isEmpty) {
    final output = <String>[
      'For more information on a specific command, type HELP command-name',
      '',
    ];
    for (final c in commands) {
      output.add('${c.name.toUpperCase().padRight(15)} ${c.description}');
    }

    output.add('');
    output.add(
      'For more information on tools see the command-line reference in the online help.',
    );

    return CommandResult(output: output);
  }

  // HELP <command>
  final name = args.first.toLowerCase();

  final command =
  await ref.read(commandByNameProvider(name).future);

  if (command == null) {
    return CommandResult(
      output: [
        'No help available for: $name',
        'Type HELP to see available commands.',
      ],
    );
  }

  return CommandResult(
    output: [
      command.name.toUpperCase(),
      '    ${command.description}',
      '',
      'USAGE',
      '    ${command.usage}',
      '',
      'DESCRIPTION',
      '    ${command.helpText}',
    ],
  );
}
