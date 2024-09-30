import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scalers_demo/core/app/app_scaffold_page.dart';
import 'package:scalers_demo/core/constants/app_constants.dart';
import 'package:scalers_demo/core/constants/asset_paths/icon_path.dart';
import 'package:scalers_demo/core/factories/circular_indicator_factory.dart';
import 'package:scalers_demo/core/helpers/shared.dart';
import 'package:scalers_demo/core/presentation/widgets/common_app_bar_widget.dart';
import 'package:scalers_demo/core/presentation/widgets/common_error_widget.dart';
import 'package:scalers_demo/core/presentation/widgets/common_title_text.dart';
import 'package:scalers_demo/features/jobs_feature/presentation/cubit/jobs_cubit/jobs_feature_cubit.dart';
import 'package:scalers_demo/features/jobs_feature/presentation/cubit/jobs_cubit/jobs_feature_state.dart';
import 'package:scalers_demo/features/jobs_feature/presentation/widgets/job_item.dart';

class JobsListHomePage extends StatefulWidget {
  const JobsListHomePage({super.key});

  @override
  State<JobsListHomePage> createState() => _JobsListHomePageState();
}

class _JobsListHomePageState extends State<JobsListHomePage> {
  late JobsFeatureCubit _jobsFeatureCubit;

  @override
  void initState() {
    super.initState();
    _jobsFeatureCubit = BlocProvider.of<JobsFeatureCubit>(context);

    _jobsFeatureCubit.getJobsList();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffoldPage(
      appBar: CommonAppBar(
        leadingWidget: CommonTitleText(
          textKey: 'Jobs',
          textFontSize: AppConstants.fontSize20,
          textWeight: FontWeight.w500,
          fontFamily: AppConstants.iBMPlexSansArabicMedium,
        ),
        withBack: false,
        leadingWidth: 120,
        withNotification: true,
        notificationIcon: IconPathsSVG.outsideNotification,
      ),
      body: BlocConsumer<JobsFeatureCubit, FetchJobsFeatureState>(
        builder: (context, state) {
          if (state is FetchJobsFeatureLoading) {
            return Center(
              child: PlatformCircularIndictor.buildCircular(context: context),
            );
          } else if (state is FetchJobsFeatureFailed) {
            return CommonError(
              errorMassage: state.message,
              withButton: true,
              onTap: () => _jobsFeatureCubit.getJobsList(),
            );
          }

          return ListView.separated(
            itemBuilder: (context, index) {
              return CommonJobItem(
                jobModel: _jobsFeatureCubit.jobsList[index],
              );
            },
            separatorBuilder: (context, index) => getSpaceHeight(AppConstants.padding16),
            itemCount: _jobsFeatureCubit.jobsList.length,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.padding16,
              vertical: AppConstants.padding8,
            ),
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
