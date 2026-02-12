import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../provider/skill_provider.dart';
import 'command_result.dart';

Future<CommandResult> handleSkills(Ref ref) async {
  final skills = await ref.read(skillProvider.future);

  if (skills.isEmpty) {
    return const CommandResult(output: ['No skills available.']);
  }

  // Group by category
  final Map<String, List<_SkillRow>> grouped = {};

  for (final s in skills) {
    for (final cat in s.category) {
      grouped.putIfAbsent(cat, () => []);
      grouped[cat]!.add(_SkillRow(name: s.name, level: s.level));
    }
  }

  // Sort categories alphabetically
  final categories = grouped.keys.toList()..sort();

  final nameWidth = _maxWidth(
    grouped.values.expand((e) => e.map((r) => r.name)),
  );

  final output = <String>['SKILLS', ''];

  for (final cat in categories) {
    output.add('[ $cat ]');

    for (final row in grouped[cat]!) {
      output.add('    ${row.name.padRight(nameWidth)}  ${row.level}');
    }

    output.add('');
  }

  if (output.last.isEmpty) {
    output.removeLast();
  }

  return CommandResult(output: output);
}

class _SkillRow {
  final String name;
  final String level;

  _SkillRow({required this.name, required this.level});
}

int _maxWidth(Iterable<String> values) {
  var max = 0;
  for (final v in values) {
    if (v.length > max) max = v.length;
  }
  return max;
}
