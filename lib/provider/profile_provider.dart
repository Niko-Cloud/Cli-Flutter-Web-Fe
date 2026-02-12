import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/model/profile_dto.dart';
import '../data/remote/profile_api.dart';
import '../data/remote/dio_client.dart';

final profileApiProvider = Provider<ProfileApi>((ref) {
  final dio = ref.read(dioProvider);
  return ProfileApi(dio);
});

final profileProvider = FutureProvider<ProfileDto?>((ref) async {
  ref.keepAlive();

  final api = ref.read(profileApiProvider);
  return api.getProfile();
});
