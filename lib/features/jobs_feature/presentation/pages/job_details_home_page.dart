import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scalers_demo/core/app/app_scaffold_page.dart';
import 'package:scalers_demo/core/constants/asset_paths/icon_path.dart';
import 'package:scalers_demo/core/factories/circular_indicator_factory.dart';
import 'package:scalers_demo/core/features/bottom_nav/presentation/logic/Bottom_Nav_Cubit/bottom_nav_cubit.dart';
import 'package:scalers_demo/core/presentation/routes/route_argument_model.dart';
import 'package:scalers_demo/core/presentation/widgets/Images/common_asset_svg_image_widget.dart';
import 'package:scalers_demo/core/presentation/widgets/common_app_bar_widget.dart';
import 'package:scalers_demo/core/presentation/widgets/common_error_widget.dart';
import 'package:scalers_demo/features/jobs_feature/presentation/cubit/job_details_cubit/jobs_details_cubit.dart';
import 'package:scalers_demo/features/jobs_feature/presentation/cubit/job_details_cubit/jobs_details_state.dart';
import 'package:scalers_demo/features/jobs_feature/presentation/widgets/job_details_item.dart';

class JobDetailsHomePage extends StatefulWidget {
  const JobDetailsHomePage({super.key});

  @override
  State<JobDetailsHomePage> createState() => _JobDetailsHomePageState();
}

class _JobDetailsHomePageState extends State<JobDetailsHomePage> {
  @override
  void initState() {
    super.initState();
    // _jobDetailsCubit = BlocProvider.of<JobDetailsCubit>(context);

    // _jobDetailsCubit.getJobDetails(uuid: RouteArguments.uuid);
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffoldPage(
      appBar: CommonAppBar(
        withBack: false,
        withNotification: true,
        leadingWidget: InkWell(
          onTap: () {
            context.read<BottomNavCubit>().setSelectedIndexedStackIndex(0);
            // context.pop();
          },
          child: const CommonAssetSvgImageWidget(
            imageString: IconPathsSVG.backArrow,
            height: 24,
            width: 24,
          ),
        ),
        notificationIcon: IconPathsSVG.insideNotification,
      ),
      body: BlocConsumer<JobDetailsCubit, JobDetailsState>(
        builder: (context, state) {
          if (state is JobDetailsLoading) {
            return PlatformCircularIndictor.buildCircular(context: context);
          } else if (state is JobDetailsFailed) {
            return CommonError(
              errorMassage: state.message,
              withButton: true,
              onTap: () => context.read<JobDetailsCubit>().getJobDetails(uuid: RouteArguments.uuid),
            );
          }

          return JobDetailsItem(jobModel: context.read<JobDetailsCubit>().jobModel);
        },
        listener: (context, state) {},
      ),
    );
  }
}
