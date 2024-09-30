import 'package:flutter/material.dart';
import 'package:scalers_demo/core/constants/app_colors.dart';
import 'package:scalers_demo/core/constants/app_constants.dart';
import 'package:scalers_demo/core/helpers/shared_texts.dart';
import 'package:scalers_demo/core/presentation/widgets/common_title_text.dart';
import 'package:scalers_demo/features/jobs_feature/data/models/job_model.dart';

class JobVariants extends StatelessWidget {
  final JobModel jobModel;

  const JobVariants({super.key, required this.jobModel});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: jobModel.icpAnswers?.typeOfSales!.map(
            (item) {
              final TextPainter textPainter = TextPainter(
                text: TextSpan(text: item.getTitle),
                textDirection: SharedText.isARLocal() ? TextDirection.ltr : TextDirection.rtl,
              )..layout();

              final double width = textPainter.size.width;

              return Container(
                width: width,
                padding: const EdgeInsets.symmetric(
                  horizontal: AppConstants.padding8,
                  vertical: AppConstants.padding4,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppConstants.borderRadius8),
                  border: Border.all(width: 1, color: AppColors.mainLightColor),
                  color: AppColors.mainLightColor,
                ),
                child: Center(
                  child: CommonTitleText(
                    textKey: item.getTitle,
                    textFontSize: AppConstants.fontSize12,
                    fontFamily: AppConstants.iBMPlexSansArabicRegular,
                    textWeight: FontWeight.w400,
                  ),
                ),
              );
            },
          ).toList() ??
          [],
    );
  }
}
