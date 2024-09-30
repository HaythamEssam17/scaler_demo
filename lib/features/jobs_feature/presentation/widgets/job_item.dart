import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scalers_demo/core/constants/app_colors.dart';
import 'package:scalers_demo/core/constants/app_constants.dart';
import 'package:scalers_demo/core/features/bottom_nav/presentation/logic/Bottom_Nav_Cubit/bottom_nav_cubit.dart';
import 'package:scalers_demo/core/helpers/extensions/container_decorations.dart';
import 'package:scalers_demo/core/helpers/extensions/format_date_time_to_time_only.dart';
import 'package:scalers_demo/core/helpers/shared.dart';
import 'package:scalers_demo/core/presentation/routes/route_argument_model.dart';
import 'package:scalers_demo/core/presentation/widgets/Images/common_cached_image_widget.dart';
import 'package:scalers_demo/core/presentation/widgets/common_title_text.dart';
import 'package:scalers_demo/features/jobs_feature/data/models/job_model.dart';
import 'package:scalers_demo/features/jobs_feature/presentation/cubit/job_details_cubit/jobs_details_cubit.dart';

class CommonJobItem extends StatelessWidget {
  final JobModel jobModel;

  const CommonJobItem({super.key, required this.jobModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        RouteArguments.uuid = jobModel.uuid!;
        context.read<BottomNavCubit>().setSelectedIndexedStackIndex(1);
        BlocProvider.of<JobDetailsCubit>(context);
        context.read<JobDetailsCubit>().getJobDetails(uuid: jobModel.uuid!);

        // context.pushNamed(RouteNames.jobDetailsHomePage);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: AppConstants.padding8, vertical: AppConstants.padding12),
        decoration: const BoxDecoration().jobItemDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                CommonCachedImageWidget(
                  imageUrl: jobModel.company!.logo!,
                  width: 54,
                  height: 54,
                  radius: AppConstants.borderRadius12,
                ),
                getSpaceWidth(AppConstants.padding8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      /// Title
                      CommonTitleText(
                        textKey: jobModel.title!,
                        textFontSize: AppConstants.fontSize14,
                        textWeight: FontWeight.w600,
                        fontFamily: AppConstants.iBMPlexSansArabicSemiBold,
                      ),
                      getSpaceHeight(AppConstants.padding8),

                      /// Company
                      CommonTitleText(
                        textKey: jobModel.company!.name!,
                        textFontSize: AppConstants.fontSize12,
                        textWeight: FontWeight.w400,
                        textColor: AppColors.subtitleColor,
                        fontFamily: AppConstants.iBMPlexSansArabicRegular,
                      ),
                      getSpaceHeight(AppConstants.padding8),

                      /// Location,Type
                      CommonTitleText(
                        textKey:
                            '${jobModel.location!.nameAr!} . ${jobModel.type!.nameAr!} . ${jobModel.workplaceType!.nameAr!}',
                        textFontSize: AppConstants.fontSize12,
                        textWeight: FontWeight.w400,
                        textColor: AppColors.subtitleColor,
                        fontFamily: AppConstants.iBMPlexSansArabicRegular,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            getSpaceHeight(AppConstants.padding16),

            /// Date
            CommonTitleText(
              textKey: DateTime.parse(jobModel.createdDate!).timeAgo(),
              textFontSize: AppConstants.fontSize12,
              textWeight: FontWeight.w400,
              textColor: AppColors.subtitleColor,
              fontFamily: AppConstants.iBMPlexSansArabicRegular,
            ),
          ],
        ),
      ),
    );
  }
}
