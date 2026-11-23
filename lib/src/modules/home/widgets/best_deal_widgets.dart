import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smt_application/src/modules/home/controllers/home_controller.dart';
import 'package:smt_application/src/modules/home/widgets/best_deal_card.dart';
import 'package:smt_application/src/modules/home/widgets/shimmer/home_best_deal_shimmer.dart';

class BestDealWidgets extends GetView<HomeController> {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SingleChildScrollView(
        physics: const BouncingScrollPhysics(),

        scrollDirection: Axis.horizontal,
        child: Row(
          children: controller.isLoading.value
              ? List.generate(3, (index) => const HomeBestDealShimmer())
              : controller.homeHotelDeal.map((item) {
                  return BestDealCard(item: item);
                }).toList(),
        ),
      ),
    );
  }
}
