import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smt_application/src/modules/home/controllers/home_controller.dart';
import 'package:smt_application/src/modules/home/widgets/dynamic_banner_card.dart';
import 'package:smt_application/src/modules/home/widgets/shimmer/home_dynamic_banner_shimmer.dart';
import 'package:smt_application/utils/app_colors.dart';

class DynamicBannerWidget extends GetView<HomeController> {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: 112,
        child: Stack(
          clipBehavior: .none,
          alignment: .center,
          children: [
            controller.isLoading.value
                ? PageView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index) =>
                        const HomeDynamicBannerShimmer(),
                  )
                : PageView.builder(
                    physics: const BouncingScrollPhysics(),
                    controller: controller.bannerPageController,
                    itemCount: controller.homeDynamicBanner.length,
                    onPageChanged: controller.onSwapBanner,
                    itemBuilder: (context, index) {
                      final banner = controller.homeDynamicBanner;
                      return DynamicBannerCard(
                        dynamicBannerItem: banner[index],
                      );
                    },
                  ),

            Positioned(
              bottom: 30,
              child: Row(
                children: List.generate(controller.homeDynamicBanner.length, (
                  index,
                ) {
                  final isActive = controller.bannerCurrentIndex.value == index;
                  return Padding(
                    padding: const EdgeInsets.only(right: 3),
                    child: Container(
                      height: 5,
                      width: isActive ? 15 : 5,
                      decoration: BoxDecoration(
                        color: AppColors.bottomBg,
                        borderRadius: .circular(10),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
