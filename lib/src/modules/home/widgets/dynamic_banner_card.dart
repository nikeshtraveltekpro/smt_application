import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smt_application/src/modules/home/controllers/home_controller.dart';
import 'package:smt_application/src/modules/home/models/home_dynamic_banner_model.dart';
import 'package:smt_application/utils/common_asset_image.dart';
import 'package:smt_application/utils/app_colors.dart';
import 'package:smt_application/utils/custom_textstyle.dart';

class DynamicBannerCard extends GetView<HomeController> {
  const new({super.key, required this.dynamicBannerItem});
  final HomeDynamicBannerModel dynamicBannerItem;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(color: AppColors.white),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),

                  child: Image.asset(dynamicBannerItem.bgImage),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 14.26, top: 15),
                  child: Column(
                    crossAxisAlignment: .start,
                    mainAxisAlignment: .start,
                    children: [
                      Container(
                        width: 180,
                        child: Text(
                          dynamicBannerItem.title,
                          maxLines: 2,

                          style: CustomTextstyle.bold700Text14,
                        ),
                      ),
                      SizedBox(height: 5.15),
                      Row(
                        mainAxisAlignment: .start,
                        children: [
                          Text(
                            dynamicBannerItem.description,
                            maxLines: 2,
                            style: CustomTextstyle.bold600Text9,
                          ),

                          dynamicBannerItem.promoCode == null
                              ? SizedBox()
                              : Container(
                                  margin: .symmetric(horizontal: 2.51),
                                  height: 13,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                  ),
                                  child: Center(
                                    child: Text(
                                      dynamicBannerItem.promoCode ?? "",
                                      maxLines: 2,
                                      style: CustomTextstyle.bold600Text8
                                          .copyWith(color: AppColors.dark_blue),
                                    ),
                                  ),
                                ),
                          Text(
                            dynamicBannerItem.descriptionSuffix ?? "",
                            maxLines: 2,
                            style: CustomTextstyle.bold600Text9,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
