import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/model/showcase_dto.dart';
import '../data/remote/showcase_api.dart';
import '../data/remote/dio_client.dart';

final showcaseApiProvider = Provider<ShowcaseApi>((ref) {
  final dio = ref.read(dioProvider);
  return ShowcaseApi(dio);
});

final showcaseProvider = FutureProvider<List<ShowcaseDto>>((ref) async {
  ref.keepAlive();

  final api = ref.read(showcaseApiProvider);
  return api.getShowcases();
});


