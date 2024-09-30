import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scalers_demo/core/app/app_scaffold_page.dart';
import 'package:scalers_demo/core/constants/app_constants.dart';
import 'package:scalers_demo/core/constants/asset_paths/icon_path.dart';
import 'package:scalers_demo/core/features/bottom_nav/presentation/widgets/nav_bar_item.dart';
import 'package:scalers_demo/core/helpers/shared.dart';
import 'package:scalers_demo/features/jobs_feature/presentation/pages/job_details_home_page.dart';

import '../../logic/Bottom_Nav_Cubit/bottom_nav_cubit.dart';
import '../../logic/Bottom_Nav_Cubit/bottom_nav_cubit_state.dart';

class BottomNavBarHomePage extends StatefulWidget {
  const BottomNavBarHomePage({super.key});

  @override
  State<BottomNavBarHomePage> createState() => _BottomNavBarHomePageState();
}

class _BottomNavBarHomePageState extends State<BottomNavBarHomePage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<BottomNavCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BottomNavCubit, BottomNavCubitState>(
      listener: (bottomNavCtx, bottomNavState) {},
      builder: (bottomNavCtx, bottomNavState) {
        return AppScaffoldPage(
          bottomNavigationBar: Container(
            height: getWidgetHeight(80),
            padding: EdgeInsets.only(bottom: getWidgetHeight(AppConstants.padding16)) +
                EdgeInsets.symmetric(
                  horizontal: getWidgetWidth(50),
                ),
            decoration: const BoxDecoration(
              color: Color(0xffFAF8FC),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, -1),
                  color: Color(0xffF0F1F2),
                ),
              ],
            ),
            child: const Row(
              children: [
                Expanded(
                  child: NavBarItem(imageString: IconPathsSVG.job, textKey: 'Jobs', index: 0),
                ),
                Expanded(
                  child: NavBarItem(imageString: IconPathsSVG.profile, textKey: 'Resume', index: 1),
                ),
                Expanded(
                  child: NavBarItem(imageString: IconPathsSVG.settings, textKey: 'Settings', index: 2),
                ),
              ],
            ),
          ),
          body: IndexedStack(
            index: context.read<BottomNavCubit>().indexedStackIndex,
            children: [
              bottomNavCtx
                  .read<BottomNavCubit>()
                  .widgetOptions
                  .elementAt(bottomNavCtx.read<BottomNavCubit>().selectedIndex),
              const JobDetailsHomePage(),
            ],
          ),
        );
      },
    );
  }
}
