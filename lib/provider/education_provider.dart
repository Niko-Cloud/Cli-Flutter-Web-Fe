import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/model/education_dto.dart';
import '../data/remote/education_api.dart';
import '../data/remote/dio_client.dart';

final educationApiProvider = Provider<EducationApi>((ref) {
  final dio = ref.read(dioProvider);
  return EducationApi(dio);
});

final educationProvider =
FutureProvider<List<EducationDto>>((ref) async {
  ref.keepAlive();

  final api = ref.read(educationApiProvider);
  return api.getEducation();
});
