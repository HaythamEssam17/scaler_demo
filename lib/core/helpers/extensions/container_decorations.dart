import 'package:flutter/material.dart';
import 'package:scalers_demo/core/constants/app_colors.dart';
import 'package:scalers_demo/core/constants/app_constants.dart';

extension ContainerBoxDecoration on BoxDecoration {
  BoxDecoration appBarDecoration() {
    return BoxDecoration(
      border: Border.all(
        width: 1,
        color: AppColors.appBarShadowColor,
      ),
      boxShadow: [
        BoxShadow(
          color: AppColors.blackColor.withOpacity(0.03),
          offset: const Offset(0, 14.0),
          blurRadius: 14.0,
          spreadRadius: -8,
        )
      ],
    );
  }

  BoxDecoration jobItemDecoration() {
    return BoxDecoration(
      color: AppColors.whiteColor,
      borderRadius: BorderRadius.circular(AppConstants.borderRadius8),
      border: Border.all(width: 1, color: AppColors.appBarShadowColor),
      boxShadow: [
        BoxShadow(
          color: AppColors.blackColor.withOpacity(0.08),
          blurRadius: 8,
          offset: const Offset(0, 0),
          spreadRadius: 0,
        )
      ],
    );
  }
}
