import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../provider/profile_provider.dart';
import 'command_result.dart';

Future<CommandResult> handleWhoami(Ref ref) async {
  final profile = await ref.read(profileProvider.future);

  if (profile == null) {
    return const CommandResult(output: ['Profile not available.']);
  }

  final output = <String>[
    'NAME',
    '    ${profile.name}',
    '',
    'ROLE',
    '    ${profile.role}',
  ];

  if (profile.location != null && profile.location!.isNotEmpty) {
    output.addAll(['', 'LOCATION', '    ${profile.location}']);
  }

  output.addAll(['', 'DESCRIPTION', ..._wrapIndented(profile.description)]);

  return CommandResult(output: output);
}

List<String> _wrapIndented(
  String text, {
  int maxWidth = 70,
  String indent = '    ',
}) {
  final words = text.split(' ');
  final lines = <String>[];

  var current = '';

  for (final word in words) {
    if ((current + word).length > maxWidth) {
      lines.add('$indent$current');
      current = word;
    } else {
      current = current.isEmpty ? word : '$current $word';
    }
  }

  if (current.isNotEmpty) {
    lines.add('$indent$current');
  }

  return lines;
}
