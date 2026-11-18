import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smt_application/utils/app_colors.dart';

class OfferBannerShimmer extends StatelessWidget {
  const OfferBannerShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.grey.withValues(alpha: 0.4),
      highlightColor: AppColors.grey.withValues(alpha: 0.2),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          height: 89,
          width: .infinity,
        ),
      ),
    );
  }
}
