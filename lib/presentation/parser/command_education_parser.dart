import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../provider/education_provider.dart';
import 'command_result.dart';

Future<CommandResult> handleEducation(Ref ref) async {
  final educationList = await ref.read(educationProvider.future);

  if (educationList.isEmpty) {
    return const CommandResult(output: ['No education history available.']);
  }

  final output = <String>['EDUCATION'];

  for (final edu in educationList) {
    final startYear = edu.startDate.year;
    final endYear = edu.endDate.year;

    output.add(
      '    ${edu.institution} | '
      '${edu.degree}'
      '${edu.major != null ? ' in ${edu.major}' : ''} | '
      '$startYear – $endYear',
    );
  }

  if (output.last.isEmpty) {
    output.removeLast();
  }

  return CommandResult(output: output);
}
