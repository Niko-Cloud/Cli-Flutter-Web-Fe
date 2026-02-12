import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/model/command_dto.dart';
import '../data/remote/command_api.dart';
import '../data/remote/dio_client.dart';

final commandApiProvider = Provider<CommandApi>((ref) {
  final dio = ref.read(dioProvider);
  return CommandApi(dio);
});

final commandListProvider = FutureProvider<List<CommandDto>>((ref) async {
  final api = ref.read(commandApiProvider);
  return api.getAllCommands();
});

final commandByNameProvider = FutureProvider.family<CommandDto?, String>((
  ref,
  name,
) async {
  final api = ref.read(commandApiProvider);
  return api.getCommandByName(name);
});
