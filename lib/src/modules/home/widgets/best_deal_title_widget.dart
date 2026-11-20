import 'package:flutter/material.dart';
import 'package:smt_application/utils/app_colors.dart';
import 'package:smt_application/utils/app_constants.dart';
import 'package:smt_application/utils/app_sizes.dart';
import 'package:smt_application/utils/custom_textstyle.dart';
class BestDealTitleWidget extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Row(
        children: [
          Text(AppConstants.bestDeal, style: CustomTextstyle.boldText15),
          SizedBox(width: 10),
          Container(
            width: AppSize.s34,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: AppColors.lightBlue1),
            ),
          ),
        ],
      ),
    );
  }
}
