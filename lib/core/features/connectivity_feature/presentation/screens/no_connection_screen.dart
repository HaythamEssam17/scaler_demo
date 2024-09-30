import 'package:flutter/material.dart';
import 'package:scalers_demo/core/constants/app_colors.dart';
import 'package:scalers_demo/core/constants/asset_paths/icon_path.dart';
import 'package:scalers_demo/core/presentation/widgets/Images/common_asset_svg_image_widget.dart';

import '../../../../helpers/shared.dart';
import '../../../../helpers/shared_texts.dart';
import '../../../../presentation/widgets/common_title_text.dart';

class NoConnectionScreen extends StatelessWidget {
  const NoConnectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CommonAssetSvgImageWidget(
                imageString: IconPathsSVG.noInternet,
                height: 185,
                width: 280,
                fit: BoxFit.fill,
              ),
              getSpaceHeight(16),
              Center(
                child: CommonTitleText(
                  textKey: SharedText.currentLocale == 'ar' ? 'لا يوجد أنترنت ' : 'No Internet Connection',
                  textColor: AppColors.blackColor,
                  maxLines: 2,
                  textOverflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ),
              getSpaceHeight(8),
              CommonTitleText(
                textKey: SharedText.currentLocale == 'ar'
                    ? 'برجاء التأكد من الأتصال بالأنترنت ثم أعد المحاولة'
                    : 'Check internet connection or try again later',
                textColor: AppColors.blackColor,
                maxLines: 2,
                textOverflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
