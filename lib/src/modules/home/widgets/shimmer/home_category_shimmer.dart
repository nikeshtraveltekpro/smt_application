import 'package:flutter/material.dart';
import 'package:smt_application/src/modules/home/widgets/shimmer/common_shimmer.dart';
import 'package:smt_application/utils/app_sizes.dart';

class HomeCategoryShimmer extends StatelessWidget {
  const HomeCategoryShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonShimmer(height: AppSize.s89, width: AppSize.s80);
  }
}
