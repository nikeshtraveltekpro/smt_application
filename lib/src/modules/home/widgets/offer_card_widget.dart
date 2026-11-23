import 'package:flutter/material.dart';
import 'package:smt_application/utils/app_colors.dart';
import 'package:smt_application/utils/app_constants.dart';
import 'package:smt_application/utils/app_sizes.dart';
import 'package:smt_application/utils/custom_textstyle.dart';
class OfferCardWidget extends StatelessWidget {
  final String image;
  final String title;

  const OfferCardWidget({super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.s280,
      height: 141,
      margin: const EdgeInsets.only(right: 10),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: SizedBox.expand(child: Image.network(image, fit: .fill)),
          ),

          Positioned(
            top: 53,
            left: 13,
            right: 65,
            child: Text(title, style: CustomTextstyle.boldText14),
          ),

          Positioned(
            top: 103,
            left: 13,
            right: 172,
            child: Container(
              height: 22,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: AppColors.white.withValues(alpha: 0.5),
                ),
                color: AppColors.white.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(AppSize.s3),
              ),
              child: Center(
                child: Text(
                  AppConstants.codeSmttrain,
                  style: CustomTextstyle.normalText10,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
