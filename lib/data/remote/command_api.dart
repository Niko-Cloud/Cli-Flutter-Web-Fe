import 'package:dio/dio.dart';

import '../mock/command_dto_mock.dart';
import '../model/api_response.dart';
import '../model/command_dto.dart';

import 'package:collection/collection.dart';

class CommandApi {
  CommandApi(this._dio);

  final Dio _dio;

  Future<List<CommandDto>> getAllCommands() async {
    try {
      final res = await _dio.get('/api/commands');

      final apiResponse = ApiResponse<List<CommandDto>>.fromJson(
        res.data,
        (data) => (data as List).map((e) => CommandDto.fromJson(e)).toList(),
      );

      return apiResponse.data;
    } on DioException catch (_) {
      return commandMockData;
    } catch (_) {
      return commandMockData;
    }
  }

  Future<CommandDto?> getCommandByName(String name) async {
    try {
      final res = await _dio.get('/api/commands/$name');

      final apiResponse = ApiResponse<List<CommandDto>>.fromJson(
        res.data,
        (data) => (data as List).map((e) => CommandDto.fromJson(e)).toList(),
      );

      return apiResponse.data.firstOrNull;
    } on DioException catch (_) {
      return commandMockData.firstWhereOrNull(
        (c) => c.name.toLowerCase() == name.toLowerCase(),
      );
    } catch (_) {
      return commandMockData.firstWhereOrNull(
        (c) => c.name.toLowerCase() == name.toLowerCase(),
      );
    }
  }
}
