import 'package:flutter/cupertino.dart';

import '../../../constants/app_constants.dart';
import '../../../helpers/shared.dart';
import 'scale_transition_loader_widget.dart';

class ListLoaderWidget extends StatelessWidget {
  final Axis? direction;
  final int? itemCount;
  final double itemHeight;
  final double itemWidth;
  final double itemRadius;
  final EdgeInsetsGeometry? padding;
  const ListLoaderWidget({
    super.key,
    this.direction = Axis.vertical,
    this.itemCount = 5,
    this.itemHeight = 40,
    this.itemWidth = 300,
    this.itemRadius = AppConstants.borderRadius8,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        padding: padding,
        physics: const BouncingScrollPhysics(),
        scrollDirection: direction!,
        itemBuilder: (context, index) {
          return LoadingShimmer(
            height: itemHeight,
            width: itemWidth,
            radius: itemRadius,
          );
        },
        separatorBuilder: (context, index) {
          return direction == Axis.vertical
              ? getSpaceHeight(AppConstants.padding8)
              : getSpaceWidth(AppConstants.padding8);
        },
        itemCount: itemCount!);
  }
}
