import 'env.dart';

class AppConfig {
  final AppEnv env;
  final String apiBaseUrl;

  const AppConfig({
    required this.env,
    required this.apiBaseUrl,
  });
}
