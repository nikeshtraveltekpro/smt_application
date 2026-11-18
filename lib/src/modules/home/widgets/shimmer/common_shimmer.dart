import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smt_application/utils/app_colors.dart';
import 'package:smt_application/utils/app_sizes.dart';

class CommonShimmer extends StatelessWidget {
  const CommonShimmer({
    super.key,
    required this.height,
    required this.width,
    this.borderRadius = const BorderRadius.all(Radius.circular(AppSize.s16)),
    this.padding = const EdgeInsets.only(left: 0),
  });
  final double height;
  final double width;
  final BorderRadius borderRadius;
  final EdgeInsetsGeometry padding;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      direction: ShimmerDirection.rtl,

      baseColor: AppColors.grey.withValues(alpha: 0.4),
      highlightColor: AppColors.grey.withValues(alpha: 0.2),
      child: Padding(
        padding: padding,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: AppColors.grey,
            borderRadius: borderRadius,
          ),
        ),
      ),
    );
  }
}
