import 'package:flutter/material.dart';
import 'package:scalers_demo/core/constants/app_colors.dart';
import 'package:scalers_demo/core/constants/app_constants.dart';
import 'package:scalers_demo/core/helpers/shared.dart';
import 'package:scalers_demo/core/presentation/widgets/Images/common_asset_svg_image_widget.dart';
import 'package:scalers_demo/core/presentation/widgets/common_global_button.dart';
import 'package:scalers_demo/core/presentation/widgets/common_title_text.dart';

Future<void> showAlertDialogWithTwoButton({
  required BuildContext context,
  String? imagePath,
  double imageWidth = 90.0,
  double imageHeight = 90.0,
  required String title,
  required String description,
  required String firstButtonText,
  required String secondButtonText,
  required Function(BuildContext ctx) firstButtonOnTap,
  required Function(BuildContext ctx) secondButtonOnTap,
  required Color titleTextColor,
  bool showImage = true,
  bool isFirstButtonLoading = false,
  double firstButtonRadius = AppConstants.borderRadius24,
  Color? firstButtonColor,
  Color? firstButtonBorderColor,
  Color? firstButtonTextColor,
  Color? secondButtonTextColor,
}) async {
  return showDialog(
      barrierColor: Colors.black.withOpacity(0.33),
      context: context,
      builder: (contextDialog) {
        return Dialog(
          alignment: Alignment.center,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.borderRadius8),
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            width: getWidgetWidth(500),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              /// Space
              getSpaceHeight(8),

              if (showImage)
                CommonAssetSvgImageWidget(
                  imageString: imagePath!,
                  height: imageHeight,
                  width: imageWidth,
                ),

              /// Space
              getSpaceHeight(16),

              /// Title
              CommonTitleText(
                textKey: title,
                textAlign: TextAlign.start,
              ),

              /// Space
              getSpaceHeight(4),

              CommonTitleText(
                textKey: description,
              ),

              /// Space
              getSpaceHeight(16),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// Cancel
                  CommonGlobalButton(
                    showBorder: true,
                    borderColor: firstButtonBorderColor ?? AppColors.errorRedColor,
                    width: 112,
                    buttonTextFontWeight: FontWeight.w400,
                    buttonTextColor: firstButtonTextColor ?? AppColors.errorRedColor,
                    buttonTextSize: AppConstants.fontSize14,
                    elevation: 0,
                    buttonBackgroundColor: firstButtonColor ?? AppColors.whiteColor,
                    buttonText: firstButtonText,
                    onPressedFunction: () {
                      firstButtonOnTap(contextDialog);
                    },
                    height: 32,
                    radius: firstButtonRadius,
                    isLoading: isFirstButtonLoading,
                    isEnable: !isFirstButtonLoading,
                  ),
                  getSpaceWidth(16),

                  /// Confirm
                  CommonGlobalButton(
                    showBorder: true,
                    borderColor: AppColors.whiteColor,
                    width: 112,
                    buttonTextFontWeight: FontWeight.w400,
                    buttonTextSize: AppConstants.fontSize14,
                    elevation: 0,
                    buttonBackgroundColor: AppColors.whiteColor,
                    buttonTextColor: secondButtonTextColor ?? AppColors.mainColor,
                    buttonText: secondButtonText,
                    onPressedFunction: () {
                      secondButtonOnTap(contextDialog);
                    },
                    height: 32,
                    isLoading: isFirstButtonLoading,
                    isEnable: !isFirstButtonLoading,
                    radius: AppConstants.borderRadius24,
                  ),
                ],
              )
            ]),
          ),
        );
      });
}
