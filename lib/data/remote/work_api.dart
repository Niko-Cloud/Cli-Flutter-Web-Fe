import 'package:cli_web/data/mock/work_experience_dto_mock.dart';
import 'package:cli_web/data/model/work_experience_dto.dart';
import 'package:dio/dio.dart';

import '../model/api_response.dart';

class WorkExperienceApi {
  WorkExperienceApi(this._dio);

  final Dio _dio;

  Future<List<WorkExperienceDto>> getWorkExperience() async {
    try {
      final res = await _dio.get('/api/work-experience');

      final apiResponse = ApiResponse<List<WorkExperienceDto>>.fromJson(
        res.data,
        (data) =>
            (data as List).map((e) => WorkExperienceDto.fromJson(e)).toList(),
      );

      return apiResponse.data;
    } catch (_) {
      return workExperienceMockData;
    }
  }
}
