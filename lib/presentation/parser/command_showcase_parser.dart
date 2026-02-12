import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/model/showcase_dto.dart';
import '../../provider/showcase_provider.dart';
import 'command_result.dart';

String _truncate(String value, int max) {
  if (value.length <= max) return value;
  return '${value.substring(0, max - 1)}…';
}

String _pad(String value, int width) {
  return value.padRight(width);
}

Future<CommandResult> handleShowcase(Ref ref, List<String> args) async {
  final showcaseData = await ref.read(showcaseProvider.future);

  if (showcaseData.isEmpty) {
    return const CommandResult(output: ['No showcase entries available.']);
  }

  if (args.isNotEmpty) {
    final id = int.tryParse(args.first);

    if (id == null) {
      return const CommandResult(
        output: ['Invalid showcase id.', 'Usage: showcase <id>'],
      );
    }

    final entry = showcaseData
        .where((e) => e.id == id)
        .cast<ShowcaseDto?>()
        .firstWhere((e) => e != null, orElse: () => null);

    if (entry == null) {
      return CommandResult(output: ['No showcase entry found with id $id.']);
    }

    return _renderShowcaseDetail(entry);
  }

  const idW = 4;
  const nameW = 32;
  const stackW = 42;
  const repoW = 60;

  final output = <String>[];

  // Title
  output.add(
    '${_pad('ID', idW)}'
    '${_pad('NAME', nameW)}'
    '${_pad('STACK', stackW)}'
    '${_pad('GITHUB REPO', repoW)}',
  );

  output.add(
    '${_pad('--', idW)}'
    '${_pad('-' * (nameW - 1), nameW)}'
    '${_pad('-' * (stackW - 1), stackW)}'
    '${_pad('-' * (repoW - 1), repoW)}',
  );

  // Rows
  for (final e in showcaseData) {
    final stack = e.stack.join(', ');
    final repo = e.repoUrl;

    output.add(
      '${_pad(e.id.toString(), idW)}'
      '${_pad(_truncate(e.title, nameW - 1), nameW)}'
      '${_pad(_truncate(stack, stackW - 1), stackW)}'
      '${_pad(_truncate(repo, repoW - 1), repoW)}',
    );
  }

  output.add('');
  output.add('Tip: type `showcase <id>` to view details of a specific entry.');

  return CommandResult(output: output);
}

CommandResult _renderShowcaseDetail(ShowcaseDto e) {
  final output = <String>[];

  output.add('NAME');
  output.add('    ${e.title}');
  output.add('');

  output.add('DESCRIPTION');
  output.add('    ${e.summary}');
  output.add('');

  output.add('STACK');
  for (final tech in e.stack) {
    output.add('    - $tech');
  }
  output.add('');

  output.add('LINKS');
  output.add('    Git: ${e.repoUrl}');
  if (e.liveUrl != null) {
    output.add('    Live:   ${e.liveUrl}');
  }

  return CommandResult(output: output);
}
