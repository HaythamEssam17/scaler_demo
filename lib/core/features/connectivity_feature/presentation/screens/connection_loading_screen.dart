import 'package:flutter/material.dart';
import 'package:scalers_demo/core/constants/app_colors.dart';
import 'package:scalers_demo/core/factories/circular_indicator_factory.dart';

class ConnectionLoadingScreen extends StatelessWidget {
  const ConnectionLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: Container(
          decoration: BoxDecoration(color: AppColors.blackColor.withOpacity(0.9)),
          child: PlatformCircularIndictor.buildCircular(context: context),
        ),
      ),
    );
  }
}
