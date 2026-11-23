import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smt_application/utils/app_colors.dart';

class HomeSubCategoryShimmer extends StatelessWidget {
  const HomeSubCategoryShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.grey.withValues(alpha: 0.4),
      highlightColor: AppColors.grey.withValues(alpha: 0.2),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          padding: const EdgeInsets.only(top: 2, left: 2),
          height: 152,
          width: .infinity,
          decoration: BoxDecoration(
            color: AppColors.white,

            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}
