import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../provider/work_provider.dart';
import 'command_result.dart';

Future<CommandResult> handleWork(Ref ref) async {
  final _monthYearFormatter = DateFormat('MMM yyyy');

  final workList = await ref.read(workExperienceProvider.future);

  if (workList.isEmpty) {
    return const CommandResult(output: ['No work experience available.']);
  }

  workList.sort((a, b) => b.startDate.compareTo(a.startDate));

  final output = <String>['WORK EXPERIENCE', ''];

  for (final work in workList) {
    final start = _monthYearFormatter.format(work.startDate);
    final end = _isPresent(work.endDate)
        ? 'Present'
        : _monthYearFormatter.format(work.endDate);

    output.add('[ $start – $end ]  ${work.company}');

    output.add('    ${work.position}');

    for (final desc in work.description) {
      output.add('    - ${_wrap(desc)}');
    }

    if (work.techStack.isNotEmpty) {
      output.add('    Tech: ${work.techStack.join(', ')}');
    }

    output.add('');
  }

  if (output.last.isEmpty) {
    output.removeLast();
  }

  return CommandResult(output: output);
}

bool _isPresent(DateTime endDate) {
  return endDate.year >= 4712;
}

String _wrap(String text, {int maxWidth = 68}) {
  if (text.length <= maxWidth) return text;

  final words = text.split(' ');
  final buffer = StringBuffer();
  var lineLength = 0;

  for (final word in words) {
    if (lineLength + word.length > maxWidth) {
      buffer.write('\n      ');
      lineLength = 0;
    }
    buffer.write('$word ');
    lineLength += word.length + 1;
  }

  return buffer.toString().trimRight();
}
