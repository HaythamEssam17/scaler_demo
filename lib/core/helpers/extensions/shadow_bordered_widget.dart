import 'package:flutter/material.dart';
import 'package:scalers_demo/core/constants/app_colors.dart';

extension ShadowBorderedWidget on BoxDecoration {
  BoxDecoration appBarBackArrow() {
    return BoxDecoration(
      shape: BoxShape.circle,
      color: AppColors.blackColor,
      boxShadow: [
        BoxShadow(color: AppColors.blackColor.withOpacity(0.08), blurRadius: 8, offset: const Offset(0, 0)),
      ],
    );
  }
}
