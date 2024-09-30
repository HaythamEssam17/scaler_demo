import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:scalers_demo/core/constants/enums/environment_typre_enum.dart';
import 'package:scalers_demo/core/helpers/shared_texts.dart';

/// [AppConfig] is a class that contains all the app configurations
class AppConfig {
  /// [baseUrl] is the base url of the app
  static String? baseUrl = dotenv.env['baseUrl'];

  // Flavors
  static String devEnv = baseUrl! + dotenv.env['dev']!;
  static String stagingEnv = baseUrl! + dotenv.env['stage']!;

  /// Api Calling Urls
  static String? jobs = dotenv.env['jobs'];

  /// [currentEnvironment] is the current environment of the app [Staging, Dev]
  static EnvironmentTypeEnum currentEnvironment = SharedText.currentEnvironment;

  static String getCurrentApiEnvironment() {
    if (currentEnvironment == EnvironmentTypeEnum.staging) {
      return stagingEnv;
    }

    return devEnv; // Another environment.
  }
}
