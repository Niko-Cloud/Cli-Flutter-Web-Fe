import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/model/skill_dto.dart';
import '../data/remote/skill_api.dart';
import '../data/remote/dio_client.dart';

final skillApiProvider = Provider<SkillApi>((ref) {
  final dio = ref.read(dioProvider);
  return SkillApi(dio);
});

final skillProvider = FutureProvider<List<SkillDto>>((ref) async {
  final api = ref.read(skillApiProvider);
  return api.getSkills();
});
