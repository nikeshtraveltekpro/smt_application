import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smt_application/utils/app_colors.dart';

class HomeTopFlightsShimmer extends StatelessWidget {
  const HomeTopFlightsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.grey.withValues(alpha: 0.4),
      highlightColor: AppColors.grey.withValues(alpha: 0.2),
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Container(
          height: 182,
          width: 168,
          decoration: BoxDecoration(
            color: AppColors.grey,
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}
