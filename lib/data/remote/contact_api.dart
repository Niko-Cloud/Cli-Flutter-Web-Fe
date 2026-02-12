import 'package:dio/dio.dart';

import '../mock/contact_dto_mock.dart';
import '../model/api_response.dart';
import '../model/contact_dto.dart';


class ContactApi {
  ContactApi(this._dio);
  final Dio _dio;

  Future<List<ContactDto>> getContacts() async {
    try {
      final res = await _dio.get('/api/contact');

      final apiResponse = ApiResponse<List<ContactDto>>.fromJson(
        res.data,
            (data) => (data as List)
            .map((e) => ContactDto.fromJson(e))
            .toList(),
      );

      return apiResponse.data;
    } catch (_) {
      return contactMockData;
    }
  }
}
