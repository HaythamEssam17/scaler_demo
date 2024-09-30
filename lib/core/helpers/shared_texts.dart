import 'package:scalers_demo/core/constants/enums/environment_typre_enum.dart';

import 'responsive_ui/device_info.dart';

class SharedText {
  static final SharedText _singleton = SharedText._internal();

  static EnvironmentTypeEnum currentEnvironment = EnvironmentTypeEnum.dev;

  factory SharedText() {
    return _singleton;
  }

  SharedText._internal();

  static double screenWidth = 0.0;
  static double screenHeight = 0.0;

  static double designWidth = 375.0;
  static double designHeight = 812.0;

  static DeviceInfo? deviceType;

  static String currentLocale = 'en';
  static String userToken = '';
  static String deviceToken = '';

  static bool isARLocal() => currentLocale == 'ar';
}
