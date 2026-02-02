import 'command_result.dart';

CommandResult parseCommand(String input) {
  final cmd = input.trim().toLowerCase();

  switch (cmd) {
    case 'help':
      const w = 12;

      String row(String cmd, String desc) {
        return '${cmd.padRight(w)} $desc';
      }

      return CommandResult(output: [
        'For more information on a specific command, type HELP command-name',
        '',
        row('WHOAMI', 'Displays information about the current user.'),
        row('SKILLS', 'Lists technical skills.'),
        row('SHOWCASE', 'Displays featured work.'),
        row('CONTACT', 'Displays contact information.'),
        row('CLEAR', 'Clears the terminal screen.'),
        '',
        'For more information on tools see the command-line reference in the online help.',
      ]);

    case 'whoami':
      return const CommandResult(output: [
        'Flutter Developer',
      ]);

    case 'skills':
      return const CommandResult(output: [
        'Flutter',
        'Dart',
        'Firebase',
        'REST API',
      ]);

    case 'showcase':
      return const CommandResult(output: [
        'Use this command to list featured projects.',
        '(data source not connected)',
      ]);

    case 'contact':
      return const CommandResult(output: [
        'Email: you@email.com',
        'GitHub: github.com/you',
        'LinkedIn: linkedin.com/in/you',
      ]);

    case 'clear':
      return const CommandResult(clear: true);

    default:
      return CommandResult(output: [
        'command not found: $cmd',
        'Type HELP to see available commands.',
      ]);
  }
}
