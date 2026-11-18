import 'package:flutter/material.dart';
import 'package:smt_application/src/modules/home/widgets/shimmer/common_shimmer.dart';

class HomeDynamicBannerShimmer extends StatelessWidget {
  const HomeDynamicBannerShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonShimmer(
      height: 112,
      width: double.infinity,
      padding: const EdgeInsetsGeometry.only(left: 20),
    );
  }
}
