import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scalers_demo/core/constants/app_colors.dart';

import '../helpers/shared.dart';

abstract class CircularFactory {
  Widget buildCircular();

  factory CircularFactory(TargetPlatform platform) {
    switch (platform) {
      case TargetPlatform.android:
        return AndroidCircular();
      case TargetPlatform.iOS:
        return IOSCircular();

      default:
        return AndroidCircular();
    }
  }
}

class AndroidCircular implements CircularFactory {
  @override
  Widget buildCircular() {
    return CircularProgressIndicator(
      color: AppColors.mainColor,
      backgroundColor: AppColors.mainLightColor,
    );
  }
}

class IOSCircular implements CircularFactory {
  @override
  Widget buildCircular() {
    return CupertinoActivityIndicator(
      color: AppColors.mainColor,
    );
  }
}

/// UI
class PlatformCircularIndictor {
  static Widget buildCircular({
    required BuildContext context,
  }) {
    return SizedBox(
      height: getWidgetHeight(60),
      width: getWidgetHeight(60),
      child: Center(
        child: CircularFactory(Theme.of(context).platform).buildCircular(),
      ),
    );
  }
}
