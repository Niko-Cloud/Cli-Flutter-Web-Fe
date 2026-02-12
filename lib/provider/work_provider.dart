import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/model/work_experience_dto.dart';
import '../data/remote/dio_client.dart';
import '../data/remote/work_api.dart';


final workExperienceApiProvider =
Provider<WorkExperienceApi>((ref) {
  final dio = ref.read(dioProvider);
  return WorkExperienceApi(dio);
});

final workExperienceProvider =
FutureProvider<List<WorkExperienceDto>>((ref) async {
  ref.keepAlive();
  
  final api = ref.read(workExperienceApiProvider);
  return api.getWorkExperience();
});
