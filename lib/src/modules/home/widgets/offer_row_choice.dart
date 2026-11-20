import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smt_application/src/modules/home/controllers/home_controller.dart';
import 'package:smt_application/src/modules/home/enums/home_enums.dart';
import 'package:smt_application/src/modules/home/widgets/offer_card_widget.dart';
import 'package:smt_application/src/modules/home/widgets/shimmer/home_offers_card_shimmer.dart';
import 'package:smt_application/utils/app_colors.dart';
import 'package:smt_application/utils/app_constants.dart';
import 'package:smt_application/utils/app_sizes.dart';
import 'package:smt_application/utils/custom_textstyle.dart';

class OfferRowChoice extends GetView<HomeController> {
  const new({super.key, required this.controller});

  @override
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Row(
            children: [
              Text(
                AppConstants.existingOffers,
                style: CustomTextstyle.boldText15,
              ),
              SizedBox(width: 10),
              Container(
                width: AppSize.s34,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: AppColors.lightBlue1),
                ),
              ),
            ],
          ),
          SizedBox(height: 14),
          SizedBox(
            height: 30,
            width: .infinity,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              clipBehavior: .none,
              scrollDirection: .horizontal,
              child: Row(
                spacing: 8,
                children: OfferFilters.values.map((name) {
                  return GestureDetector(
                    onTap: () {
                      controller.selectOffer(name.title);
                    },
                    child: Container(
                      height: 30,
                      padding: EdgeInsets.symmetric(horizontal: 9.33),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        border: Border.all(width: 1, color: AppColors.white),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.shadowBlue,
                            offset: const Offset(0, 1.94),
                            blurRadius: 12.62,
                          ),
                        ],

                        borderRadius: BorderRadius.circular(34),
                      ),

                      child: Obx(() {
                        final selected =
                            controller.selectedOffer.value == name.title;
                        return Center(
                          child: Text(
                            name.title,
                            style: selected
                                ? CustomTextstyle.selectedOfferRed12
                                : CustomTextstyle.boldText12,
                          ),
                        );
                      }),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          SizedBox(height: 14),
          Obx(
            () => SizedBox(
              height: 160,
              width: .infinity,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: .horizontal,
                child: Row(
                  children: controller.isLoading.value
                      ? List.generate(
                          3,
                          (index) => Padding(
                            padding: EdgeInsets.only(right: 8),
                            child: HomeOffersCardShimmer(),
                          ),
                        )
                      : controller.filterOffer.map((item) {
                          return Padding(
                            padding: EdgeInsets.only(right: 8),
                            child: OfferCardWidget(
                              image: item.image,
                              title: item.title,
                            ),
                          );
                        }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
