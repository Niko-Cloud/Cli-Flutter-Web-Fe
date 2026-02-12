import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../config/app_config.dart';
import '../config/env.dart';

final appConfigProvider = Provider<AppConfig>((ref) {
  const isProd = bool.fromEnvironment('dart.vm.product');

  if (isProd) {
    return const AppConfig(
      env: AppEnv.prod,
      apiBaseUrl: 'http://localhost:8080',
    );
  }

  return const AppConfig(
    env: AppEnv.dev,
    apiBaseUrl: 'http://localhost:8080',
  );
});
