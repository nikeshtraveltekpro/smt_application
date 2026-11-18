import 'package:flutter/material.dart';
import 'package:smt_application/src/modules/home/widgets/shimmer/common_shimmer.dart';

class HomeBestDealShimmer extends StatelessWidget {
  const HomeBestDealShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonShimmer(
      height: 229,
      width: 205,
      padding: const EdgeInsets.only(left: 20.0),
    );
  }
}
