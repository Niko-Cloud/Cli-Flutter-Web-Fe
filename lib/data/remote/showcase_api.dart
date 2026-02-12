import 'package:dio/dio.dart';

import '../mock/showcase_dto_mock.dart';
import '../model/api_response.dart';
import '../model/showcase_dto.dart';

class ShowcaseApi {
  ShowcaseApi(this._dio);

  final Dio _dio;

  Future<List<ShowcaseDto>> getShowcases() async {
    try {
      final res = await _dio.get('/api/showcase');

      final apiResponse = ApiResponse<List<ShowcaseDto>>.fromJson(
        res.data,
        (data) => (data as List).map((e) => ShowcaseDto.fromJson(e)).toList(),
      );

      return apiResponse.data;
    } catch (_) {
      return showcaseData;
    }
  }
}
