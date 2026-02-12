import 'package:cli_web/provider/work_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'command_provider.dart';
import 'profile_provider.dart';
import 'skill_provider.dart';
import 'showcase_provider.dart';
import 'education_provider.dart';

import 'contact_provider.dart';

void prefetchStaticData(WidgetRef ref) {
  ref.read(commandListProvider.future);
  ref.read(profileProvider.future);
  ref.read(skillProvider.future);
  ref.read(showcaseProvider.future);
  ref.read(educationProvider.future);
  ref.read(workExperienceProvider.future);
  ref.read(contactProvider.future);
}
