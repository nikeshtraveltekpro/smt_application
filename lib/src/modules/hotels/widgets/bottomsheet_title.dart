import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smt_application/generated/assets.dart';
import 'package:smt_application/utils/app_colors.dart';
import 'package:smt_application/utils/common_asset_image.dart';
import 'package:smt_application/utils/custom_textstyle.dart';

class BottomSheetTitle extends StatelessWidget {
  const new({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          Text(title, style: CustomTextstyle.bold600Text15),
          Container(
            height: 25,
            width: 25,
            decoration: BoxDecoration(
              shape: .circle,
              color: AppColors.lighBlue,
            ),
            child: GestureDetector(
              onTap: () => Get.back(),
              child: CommonAssetImage(
                image: Assets.cross,
                height: 8,
                width: 8,
                fit: .none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
