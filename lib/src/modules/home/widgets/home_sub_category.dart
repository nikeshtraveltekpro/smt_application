import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smt_application/src/modules/home/controllers/home_controller.dart';
import 'package:smt_application/utils/common_asset_image.dart';
import 'package:smt_application/src/modules/home/widgets/shimmer/home_sub_category_shimmer.dart';
import 'package:smt_application/utils/app_colors.dart';
import 'package:smt_application/utils/app_sizes.dart';
import 'package:smt_application/utils/custom_textstyle.dart';

class HomeSubCategory extends GetView<HomeController> {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.value
          ? HomeSubCategoryShimmer()
          : controller.hasError.value
          ? Center(child: Text("Error : ${controller.errorMsg.value}"))
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: EdgeInsets.only(top: 2, left: 2),
                height: 152,
                width: .infinity,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.shadow_blue,
                      offset: Offset(0, 1.94),
                      blurRadius: 12.62,
                      spreadRadius: 0,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  runAlignment: WrapAlignment.spaceEvenly,

                  spacing: AppSize.s9,
                  runSpacing: 0,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children: controller.homeSubCategory.map((item) {
                    return SizedBox(
                      width: 76,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 5,
                        ),
                        child: Column(
                          mainAxisSize: .min,
                          crossAxisAlignment: .center,
                          mainAxisAlignment: .start,
                          children: [
                            CommonAssetImage(
                              image: item.icon,
                              height: 18,
                              width: 18,
                            ),
                            SizedBox(height: AppSize.s11),
                            Text(
                              textAlign: .center,
                              style: CustomTextstyle.normalText12,

                              item.title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
    );
  }
}
