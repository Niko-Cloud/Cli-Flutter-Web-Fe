import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/model/contact_dto.dart';
import '../data/remote/contact_api.dart';
import '../data/remote/dio_client.dart';

final contactApiProvider = Provider<ContactApi>((ref) {
  final dio = ref.read(dioProvider);
  return ContactApi(dio);
});

final contactProvider =
FutureProvider<List<ContactDto>>((ref) async {
  final api = ref.read(contactApiProvider);
  return api.getContacts();
});
