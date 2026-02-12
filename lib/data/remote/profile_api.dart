import 'package:dio/dio.dart';

import '../mock/profile_dto_mock.dart';
import '../model/api_response.dart';
import '../model/profile_dto.dart';

class ProfileApi {
  ProfileApi(this._dio);

  final Dio _dio;

  Future<ProfileDto?> getProfile() async {
    try {
      final res = await _dio.get('/api/profile');

      final apiResponse = ApiResponse<List<ProfileDto>>.fromJson(
        res.data,
        (data) => (data as List).map((e) => ProfileDto.fromJson(e)).toList(),
      );

      return apiResponse.data.isNotEmpty ? apiResponse.data.first : null;
    } catch (_) {
      return profileMockData.isNotEmpty ? profileMockData.first : null;
    }
  }
}
