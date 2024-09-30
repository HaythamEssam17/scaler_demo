import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:scalers_demo/core/constants/asset_paths/icon_path.dart';
import 'package:scalers_demo/core/factories/circular_indicator_factory.dart';
import 'package:scalers_demo/core/helpers/extensions/double_extensions.dart';

import 'common_asset_svg_image_widget.dart';

class CommonCachedImageWidget extends StatelessWidget {
  final String imageUrl;
  final String? imagePlaceHolder;
  final double width;
  final double height;
  final double? radius;
  final BoxFit? fit;
  final bool? isCircular;
  final bool? isProfile;
  final Color? errorImageColor;
  const CommonCachedImageWidget(
      {super.key,
      required this.imageUrl,
      required this.width,
      required this.height,
      this.isCircular = false,
      this.isProfile = false,
      this.radius = 0.0,
      this.fit = BoxFit.fill,
      this.imagePlaceHolder,
      this.errorImageColor});

  @override
  Widget build(BuildContext context) {
    final double imageHeight = height.getWidgetHeight();
    final double imageWidth = isCircular! ? height.getWidgetHeight() : width.getWidgetWidth();

    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => Container(
        height: imageHeight,
        width: imageWidth,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            radius!,
          ),
          image: DecorationImage(
            image: imageProvider,
            fit: fit,
          ),
        ),
      ),
      placeholder: (context, img) => Container(
        height: imageHeight,
        width: imageWidth,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            radius!,
          ),
        ),
        child: Center(
          child: PlatformCircularIndictor.buildCircular(context: context),
        ),
      ),
      errorWidget: (context, url, error) => CommonAssetSvgImageWidget(
        imageString: imagePlaceHolder ?? IconPathsSVG.job,
        height: imageHeight,
        width: imageWidth,
        fit: fit!,
        radius: radius!,
        isCircular: isCircular!,
        imageColor: errorImageColor,
      ),
    );
  }
}
