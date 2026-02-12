import 'package:dio/dio.dart';

import '../mock/education_dto_mock.dart';
import '../model/api_response.dart';
import '../model/education_dto.dart';

class EducationApi {
  EducationApi(this._dio);

  final Dio _dio;

  Future<List<EducationDto>> getEducation() async {
    try {
      final res = await _dio.get('/api/education');

      final apiResponse = ApiResponse<List<EducationDto>>.fromJson(
        res.data,
        (data) => (data as List).map((e) => EducationDto.fromJson(e)).toList(),
      );

      return apiResponse.data;
    } catch (_) {
      return educationMockData;
    }
  }
}
