import 'command_result.dart';

CommandResult parseCommand(String input) {
  final parts = input.trim().split(RegExp(r'\s+'));
  final cmd = parts.first.toLowerCase();
  final args = parts.skip(1).toList();

  switch (cmd) {
    case 'help':
      return _handleHelp(args);

    case 'whoami':
      return const CommandResult(output: ['Flutter Developer']);

    case 'skills':
      return const CommandResult(
        output: ['Flutter', 'Dart', 'Firebase', 'REST API'],
      );

    case 'showcase':
      return const CommandResult(
        output: [
          'Use this command to list featured projects.',
          '(data source not connected)',
        ],
      );

    case 'contact':
      return const CommandResult(
        output: [
          'Email: you@email.com',
          'GitHub: github.com/you',
          'LinkedIn: linkedin.com/in/you',
        ],
      );

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

CommandResult _handleHelp(List<String> args) {
  // HELP (GENERAL)
  if (args.isEmpty) {
    return const CommandResult(
      output: [
        'For more information on a specific command, type HELP command-name',
        '',
        'WHOAMI         Displays information about the current user.',
        'SKILLS         Lists technical skills.',
        'SHOWCASE       Displays featured portfolio items.',
        'CONTACT        Displays contact information.',
        'CLEAR          Clears the terminal screen.',
        '',
        'For more information on tools see the command-line reference in the online help.',
      ],
    );
  }

  // HELP (COMMAND PER NAME)
  final commandName = args.first.toLowerCase();

  switch (commandName) {
    case 'whoami':
      return const CommandResult(
        output: [
          'WHOAMI',
          '    Displays information about the current user.',
          '',
          'USAGE',
          '    whoami',
        ],
      );

    case 'skills':
      return const CommandResult(
        output: [
          'SKILLS',
          '    Lists technical skills.',
          '',
          'USAGE',
          '    skills',
        ],
      );

    case 'showcase':
      return const CommandResult(
        output: [
          'SHOWCASE',
          '    Displays featured portfolio items.',
          '',
          'USAGE',
          '    showcase',
          '',
          'DESCRIPTION',
          '    Lists applications, tools, and experiments',
          '    included in this portfolio.',
        ],
      );

    case 'contact':
      return const CommandResult(
        output: [
          'CONTACT',
          '    Displays contact information.',
          '',
          'USAGE',
          '    contact',
        ],
      );

    case 'clear':
      return const CommandResult(
        output: [
          'CLEAR',
          '    Clears the terminal screen.',
          '',
          'USAGE',
          '    clear',
        ],
      );

    default:
      return CommandResult(
        output: [
          'No help available for: $commandName',
          'Type HELP to see available commands.',
        ],
      );
  }
}
