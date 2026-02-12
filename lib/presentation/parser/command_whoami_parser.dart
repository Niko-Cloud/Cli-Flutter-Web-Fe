import 'command_result.dart';

CommandResult handleWhoami() {
  return CommandResult(
    output: [
      'NAME',
      '    Your Name',
      '',
      'DESCRIPTION',
      '    Flutter developer focused on building clean,',
      '    fast, and scalable cross-platform applications.',
    ],
  );
}
