import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smt_application/src/modules/home/controllers/home_controller.dart';
import 'package:smt_application/utils/app_colors.dart';
import 'package:smt_application/utils/app_sizes.dart';

class HomeOffersCardShimmer extends GetView<HomeController> {
  const HomeOffersCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.grey.withValues(alpha: 0.4),
      highlightColor: AppColors.grey.withValues(alpha: 0.2),
      child: Container(
        width: AppSize.s280,
        height: 141,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
