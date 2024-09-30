import 'package:flutter/material.dart';
import 'package:scalers_demo/core/constants/app_colors.dart';
import 'package:scalers_demo/core/helpers/extensions/container_decorations.dart';
import 'package:scalers_demo/core/helpers/extensions/context_extensions.dart';
import 'package:scalers_demo/core/helpers/extensions/shadow_bordered_widget.dart';
import 'package:scalers_demo/core/presentation/widgets/Images/common_asset_svg_image_widget.dart';

import '../../constants/app_constants.dart';
import '../../constants/asset_paths/icon_path.dart';
import '../../helpers/shared.dart';
import '../../helpers/shared_texts.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool withBack;
  final bool withNotification;
  final bool centerTitle;
  final Widget? customActionWidget;
  final Widget? titleWidget;
  final Widget? leadingWidget;
  final String? sourcePage;
  final String? notificationIcon;
  final double elevation;
  final double actionPadding;
  final double? leadingWidth;
  final Color? backGroundColor;
  final Function()? onBackPressed;

  const CommonAppBar(
      {super.key,
      this.onBackPressed,
      this.withBack = true,
      this.titleWidget,
      this.withNotification = false,
      this.centerTitle = true,
      this.sourcePage = '',
      this.leadingWidget,
      this.elevation = 0,
      this.leadingWidth,
      this.customActionWidget,
      this.notificationIcon,
      this.actionPadding = AppConstants.padding16,
      this.backGroundColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration().appBarDecoration(),
      child: AppBar(
        backgroundColor: backGroundColor!,
        elevation: elevation,
        centerTitle: centerTitle,
        automaticallyImplyLeading: withBack,
        titleSpacing: 0,
        leadingWidth: withBack ? getWidgetWidth(40) : leadingWidth,
        leading: withBack
            ? FittedBox(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(width: AppConstants.padding16),
                    GestureDetector(
                      onTap: onBackPressed ?? () => context.pop(),
                      child: Container(
                        padding: const EdgeInsets.all(AppConstants.padding8),
                        decoration: const BoxDecoration().appBarBackArrow(),
                        child: RotatedBox(
                          quarterTurns: SharedText.currentLocale == "ar" ? 0 : 2,
                          child: CommonAssetSvgImageWidget(
                              imageString: IconPathsSVG.backArrow,
                              height: 24,
                              imageColor: AppColors.mainColor,
                              width: 24),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : leadingWidget != null
                ? Row(
                    children: [getSpaceWidth(AppConstants.padding16), leadingWidget ?? const SizedBox()],
                  )
                : const SizedBox(),
        title: titleWidget,
        actions: [
          if (withNotification)
            GestureDetector(
              child: CommonAssetSvgImageWidget(
                  imageString: notificationIcon ?? IconPathsSVG.outsideNotification,
                  height: 36,
                  imageColor: AppColors.mainColor,
                  width: 36),
            ),
          customActionWidget ?? const SizedBox(),
          SizedBox(width: actionPadding),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  Size get bottomSize => const Size.fromHeight(kToolbarHeight + 14);

  Size get emptyBottomSize => const Size.fromHeight(0);
}
