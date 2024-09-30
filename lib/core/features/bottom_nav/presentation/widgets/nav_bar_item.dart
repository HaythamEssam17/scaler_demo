import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scalers_demo/core/constants/app_colors.dart';
import 'package:scalers_demo/core/constants/app_constants.dart';
import 'package:scalers_demo/core/features/bottom_nav/presentation/logic/Bottom_Nav_Cubit/bottom_nav_cubit.dart';
import 'package:scalers_demo/core/features/bottom_nav/presentation/logic/Bottom_Nav_Cubit/bottom_nav_cubit_state.dart';
import 'package:scalers_demo/core/helpers/shared.dart';
import 'package:scalers_demo/core/presentation/widgets/Images/common_asset_svg_image_widget.dart';
import 'package:scalers_demo/core/presentation/widgets/common_title_text.dart';

class NavBarItem extends StatelessWidget {
  final String imageString;
  final String textKey;
  final int index;

  const NavBarItem({super.key, required this.imageString, required this.textKey, required this.index});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BottomNavCubit, BottomNavCubitState>(
      listener: (context, state) {},
      builder: (context, state) {
        return InkWell(
          onTap: () => context.read<BottomNavCubit>().selectItem(index),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommonAssetSvgImageWidget(
                imageString: imageString,
                height: 24,
                width: 24,
                imageColor: context.read<BottomNavCubit>().selectedIndex == index
                    ? AppColors.mainColor
                    : AppColors.unSelectedTabIconColor,
              ),
              getSpaceHeight(AppConstants.padding8),
              CommonTitleText(
                textKey: textKey,
                fontFamily: AppConstants.iBMPlexSansArabicSemiBold,
                textWeight: FontWeight.w600,
                textFontSize: AppConstants.fontSize12,
                textColor: context.read<BottomNavCubit>().selectedIndex == index
                    ? AppColors.mainColor
                    : AppColors.subtitleColor,
              ),
            ],
          ),
        );
      },
    );
  }
}
