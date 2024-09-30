import 'package:flutter/material.dart';
import 'package:scalers_demo/core/presentation/widgets/Images/common_asset_svg_image_widget.dart';

import '../../constants/app_constants.dart';
import '../../helpers/shared.dart';
import 'common_global_button.dart';
import 'common_title_text.dart';

class CommonError extends StatelessWidget {
  final String? errorMassage;
  final bool? withButton;
  final Function()? onTap;

  const CommonError({super.key, this.errorMassage, this.withButton = false, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Center(
          child: CommonAssetSvgImageWidget(imageString: "error_icon.svg", height: 220, width: 280, fit: BoxFit.fill),
        ),
        getSpaceHeight(AppConstants.padding16),
        const CommonTitleText(
          textKey: 'خطأ فني',
          textOverflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
        getSpaceHeight(AppConstants.padding8),
        Row(
          children: [
            Expanded(
              child: CommonTitleText(
                textKey: errorMassage == null || errorMassage!.isEmpty ? 'Smoething went wrong' : errorMassage!,
                textOverflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
            ),
          ],
        ),
        if (withButton!) ...[
          getSpaceHeight(AppConstants.padding16),
          CommonGlobalButton(
            onPressedFunction: onTap ?? () {},
            buttonText: 'Retry',
          )
        ]
      ],
    );
  }
}
