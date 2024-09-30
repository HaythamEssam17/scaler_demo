import 'package:flutter/material.dart';
import 'package:scalers_demo/core/constants/app_constants.dart';
import 'package:scalers_demo/core/constants/enums/environment_typre_enum.dart';
import 'package:scalers_demo/core/helpers/responsive_ui/device_info.dart';
import 'package:scalers_demo/core/helpers/responsive_ui/ui_components.dart';
import 'package:scalers_demo/core/helpers/shared_texts.dart';
import 'package:scalers_demo/core/presentation/routes/route_generator.dart';

class AppMaterialWidget extends StatelessWidget {
  final Widget homeWidget;

  const AppMaterialWidget({super.key, required this.homeWidget});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: RouteGenerator.generateRoute,
      title: AppConstants.appName,
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,

      /// widget that gets current device width and height and type
      home: InfoComponents(
        builder: (BuildContext infoComponentsContext, DeviceInfo deviceInfo) {
          if (deviceInfo.orientation == Orientation.portrait) {
            SharedText.screenHeight = deviceInfo.screenHeight;
            SharedText.screenWidth = deviceInfo.screenWidth;
            SharedText.deviceType = deviceInfo;
          } else {
            SharedText.screenHeight = deviceInfo.screenWidth;
            SharedText.screenWidth = deviceInfo.screenHeight;
            SharedText.deviceType = deviceInfo;
          }

          SharedText.currentEnvironment = EnvironmentTypeEnum.dev;

          return homeWidget;
        },
      ),
    );
  }
}
