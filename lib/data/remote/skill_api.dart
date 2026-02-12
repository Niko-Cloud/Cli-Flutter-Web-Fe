import 'package:dio/dio.dart';
import '../mock/skill_dto_mock.dart';
import '../model/api_response.dart';

import '../model/skill_dto.dart';

class SkillApi {
  SkillApi(this._dio);

  final Dio _dio;

  Future<List<SkillDto>> getSkills() async {
    try {
      final res = await _dio.get('/api/skill');

      final apiResponse = ApiResponse<List<SkillDto>>.fromJson(
        res.data,
        (data) => (data as List).map((e) => SkillDto.fromJson(e)).toList(),
      );

      return apiResponse.data;
    } catch (_) {
      return skillMockData;
    }
  }
}
