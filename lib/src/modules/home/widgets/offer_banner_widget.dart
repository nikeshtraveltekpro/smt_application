import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smt_application/generated/assets.dart';
import 'package:smt_application/src/modules/home/controllers/home_controller.dart';
import 'package:smt_application/utils/common_asset_image.dart';
import 'package:smt_application/src/modules/home/widgets/shimmer/offer_banner_shimmer.dart';
import 'package:smt_application/utils/app_colors.dart';
import 'package:smt_application/utils/app_constants.dart';
import 'package:smt_application/utils/custom_textstyle.dart';

class OfferBannerWidget extends GetView<HomeController> {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.value
          ? OfferBannerShimmer()
          : Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.blue, AppColors.lightBlue],
                    begin: AlignmentGeometry.centerLeft,
                    end: AlignmentDirectional.centerEnd,
                  ),

                  borderRadius: BorderRadius.circular(16),
                ),
                height: 89,
                width: .infinity,
                child: Stack(
                  clipBehavior: .none,
                  children: [
                    Positioned(
                      right: 20,
                      child: CommonAssetImage(image: Assets.femaleBackground),
                    ),

                    Row(
                      children: [
                        Column(
                          mainAxisAlignment: .start,
                          crossAxisAlignment: .start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 12.5,
                                left: 19.87,
                              ),
                              child: Text(
                                AppConstants.zeroPaymentFees,
                                style: CustomTextstyle.boldText20,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 2.5,
                                left: 19.87,
                              ),

                              child: SizedBox(
                                width: 229,
                                child: Text(
                                  AppConstants.payViaUpi,
                                  maxLines: 2,
                                  overflow: .ellipsis,
                                  style: CustomTextstyle.normalText11,
                                ),
                              ),
                            ),
                          ],
                        ),

                        Align(
                          alignment: .bottomEnd,
                          child: Image.asset(Assets.femaleCharacter, scale: 1),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
