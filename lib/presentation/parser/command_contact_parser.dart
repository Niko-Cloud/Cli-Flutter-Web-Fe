import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../provider/contact_provider.dart';
import 'command_result.dart';

Future<CommandResult> handleContact(Ref ref) async {
  final contacts = await ref.read(contactProvider.future);

  if (contacts.isEmpty) {
    return const CommandResult(output: ['No contact information available.']);
  }

  final output = <String>['CONTACT'];
  
  final seen = <String>{};

  for (final c in contacts) {
    final key = '${c.type}:${c.value}';
    if (seen.add(key)) {
      output.add('    ${c.type.padRight(10)} ${c.value}');
    }
  }

  return CommandResult(output: output);
}
