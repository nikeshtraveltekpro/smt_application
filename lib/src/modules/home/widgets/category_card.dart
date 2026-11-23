import 'package:flutter/material.dart';
import 'package:smt_application/src/modules/home/models/home_category_model.dart';
import 'package:smt_application/utils/common_asset_image.dart';
import 'package:smt_application/utils/app_colors.dart';
import 'package:smt_application/utils/app_sizes.dart';
class CategoryCard extends StatelessWidget {
  const new({super.key, required this.categoryItem});
  final HomeCategoryModel categoryItem;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.s89,
      width: AppSize.s80,
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.bottomBg, width: 0.97),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadowBlue,
            offset: Offset(0, 1.94),
            blurRadius: AppSize.s12_62,
            spreadRadius: 0,
          ),
        ],
        borderRadius: BorderRadius.circular(AppSize.s16),
      ),
      child: Column(
        children: [
          const SizedBox(height: AppSize.s16s),
          CommonAssetImage(image: categoryItem.icon, height: 20, width: 20),
          const SizedBox(height: AppSize.s7),
          Text(categoryItem.title),
        ],
      ),
    );
  }
}