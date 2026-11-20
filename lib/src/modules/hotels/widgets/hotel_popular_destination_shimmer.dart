import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smt_application/utils/app_colors.dart';

class HotelPopularDestinationShimmer extends StatelessWidget {
  const HotelPopularDestinationShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.grey.withValues(alpha: 0.4),
      highlightColor: AppColors.grey.withValues(alpha: 0.2),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            children: List.generate(
              6,
              (index) => Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Container(
                  height: 139.53,
                  width: 139.53,
                  decoration: BoxDecoration(
                    color: AppColors.grey,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
