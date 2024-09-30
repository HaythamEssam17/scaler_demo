import 'package:flutter/material.dart';
import 'package:scalers_demo/core/constants/app_colors.dart';
import 'package:scalers_demo/core/constants/app_constants.dart';
import 'package:scalers_demo/core/helpers/shared.dart';
import 'package:scalers_demo/core/presentation/widgets/Images/common_cached_image_widget.dart';
import 'package:scalers_demo/core/presentation/widgets/common_title_text.dart';
import 'package:scalers_demo/features/jobs_feature/data/models/job_model.dart';

import 'job_variants.dart';

class JobDetailsItem extends StatelessWidget {
  final JobModel jobModel;

  const JobDetailsItem({super.key, required this.jobModel});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: AppConstants.padding16, vertical: AppConstants.padding24),
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Company Details
          ...[
            Row(
              children: [
                CommonCachedImageWidget(
                  imageUrl: jobModel.company?.logo ?? '',
                  width: 42,
                  height: 42,
                  radius: AppConstants.borderRadius12,
                ),
                getSpaceWidth(AppConstants.padding8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      /// Company
                      CommonTitleText(
                        textKey: jobModel.company?.name ?? '',
                        textFontSize: AppConstants.fontSize16,
                        textWeight: FontWeight.w500,
                        fontFamily: AppConstants.iBMPlexSansArabicMedium,
                      ),
                      getSpaceHeight(AppConstants.padding8),

                      /// Location,Type
                      CommonTitleText(
                        textKey:
                            '${jobModel.location?.nameAr} . ${jobModel.type?.nameAr!} . ${jobModel.workplaceType?.nameAr!}',
                        textFontSize: AppConstants.fontSize11,
                        textWeight: FontWeight.w400,
                        textColor: AppColors.subtitleColor,
                        fontFamily: AppConstants.iBMPlexSansArabicRegular,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            getSpaceHeight(AppConstants.padding24),
          ],

          /// Work Details
          ...[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                /// Company
                CommonTitleText(
                  textKey: jobModel.company?.name ?? '',
                  textFontSize: AppConstants.fontSize16,
                  textWeight: FontWeight.w500,
                  fontFamily: AppConstants.iBMPlexSansArabicMedium,
                ),
                getSpaceHeight(AppConstants.padding8),

                /// Location,Type
                CommonTitleText(
                  textKey:
                      '${jobModel.location?.nameAr!} . ${jobModel.type?.nameAr!} . ${jobModel.workplaceType?.nameAr!}',
                  textFontSize: AppConstants.fontSize12,
                  textWeight: FontWeight.w400,
                  textColor: AppColors.subtitleColor,
                  fontFamily: AppConstants.iBMPlexSansArabicRegular,
                ),
                getSpaceHeight(AppConstants.padding8),

                /// Variatns
                JobVariants(jobModel: jobModel),
              ],
            ),
            getSpaceHeight(AppConstants.padding24),
          ],

          /// Description
          ...[
            // Title
            CommonTitleText(
              textKey: "Job Description",
              textFontSize: AppConstants.fontSize16,
              textWeight: FontWeight.w500,
              fontFamily: AppConstants.iBMPlexSansArabicMedium,
            ),
            getSpaceHeight(AppConstants.padding16),

            CommonTitleText(
              textKey: jobModel.icpAnswers?.jobRole?[0].descriptionAr ?? '',
              fontFamily: AppConstants.iBMPlexSansArabicRegular,
              textFontSize: AppConstants.fontSize14,
              textWeight: FontWeight.w400,
              textColor: AppColors.descriptionLightGreyColor,
              maxLines: 100,
            ),
            getSpaceHeight(AppConstants.padding24),
          ],

          /// Responsibilities
          ...[
            // Title
            CommonTitleText(
              textKey: "Key Responsibilities",
              textFontSize: AppConstants.fontSize16,
              textWeight: FontWeight.w500,
              fontFamily: AppConstants.iBMPlexSansArabicMedium,
            ),
            getSpaceHeight(AppConstants.padding16),

            CommonTitleText(
              textKey: jobModel.icpAnswers?.getFullJobDescription ?? '',
              fontFamily: AppConstants.iBMPlexSansArabicRegular,
              textFontSize: AppConstants.fontSize14,
              textWeight: FontWeight.w400,
              textColor: AppColors.descriptionLightGreyColor,
              maxLines: 100,
            ),
            getSpaceHeight(AppConstants.padding24),
          ],
        ],
      ),
    );
  }
}
