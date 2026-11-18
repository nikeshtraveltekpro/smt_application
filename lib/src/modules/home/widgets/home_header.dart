import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smt_application/generated/assets.dart';
import 'package:smt_application/routes/app_pages.dart';
import 'package:smt_application/src/modules/home/controllers/home_controller.dart';
import 'package:smt_application/src/modules/home/widgets/category_card.dart';
import 'package:smt_application/utils/common_asset_image.dart';
import 'package:smt_application/src/modules/home/widgets/shimmer/home_category_shimmer.dart';
import 'package:smt_application/utils/app_colors.dart';
import 'package:smt_application/utils/app_sizes.dart';

class HomeHeader extends GetView<HomeController> {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CommonAssetImage(image: Assets.screenBg),
        Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 51.26),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Image.asset(Assets.smtLogo, height: 38, width: 120),
                  Container(
                    height: AppSize.s40,
                    width: AppSize.s40,
                    decoration: BoxDecoration(
                      color: AppColors.bottom_bg.withValues(alpha: 0.4),
                      shape: .circle,
                      border: Border.all(
                        width: 1,
                        color: AppColors.white.withValues(alpha: 0.7),
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          right: 11,
                          top: 6,
                          child: Container(
                            height: 9,
                            width: 9,
                            decoration: BoxDecoration(
                              color: AppColors.red,
                              shape: .circle,
                            ),
                          ),
                        ),
                        Center(
                          child: CommonAssetImage(
                            image: Assets.bell,
                            height: 21,
                            width: 21,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSize.s19),
              SizedBox(
                height: AppSize.s89,
                width: .infinity,
                child: Row(
                  children: [
                    Expanded(
                      child: Obx(
                        () => controller.isLoading.value
                            ? ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: HomeCategoryShimmer(),
                                ),
                                itemCount: 4,
                              )
                            : controller.hasError.value
                            ? Center(
                                child: Text(
                                  "Error : ${controller.errorMsg.value}",
                                ),
                              )
                            : ListView.builder(
                                scrollDirection: .horizontal,
                                itemCount: controller.homeCategory.length,
                                itemBuilder: (context, index) {
                                  final categoryItem =
                                      controller.homeCategory[index];
                                  return Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: GestureDetector(
                                      onTap: () {
                                        if (index == 2) {
                                          print(
                                            "===================tapped===============",
                                          );
                                          Get.toNamed(Routes.hotel);
                                        }
                                      },
                                      child: CategoryCard(
                                        categoryItem: categoryItem,
                                      ),
                                    ),
                                  );
                                },
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
