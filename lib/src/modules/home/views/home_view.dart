import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smt_application/src/modules/home/widgets/best_deal_title_widget.dart';
import 'package:smt_application/src/modules/home/widgets/best_deal_widgets.dart';
import 'package:smt_application/src/modules/home/widgets/dynamic_banner_widget.dart';
import 'package:smt_application/src/modules/home/widgets/home_header.dart';
import 'package:smt_application/src/modules/home/widgets/home_sub_category.dart';
import 'package:smt_application/src/modules/home/widgets/offer_banner_widget.dart';
import 'package:smt_application/src/modules/home/widgets/offer_row_choice.dart';
import 'package:smt_application/src/modules/home/widgets/top_flights_title_widget.dart';
import 'package:smt_application/src/modules/home/widgets/top_flights_widgets.dart';
import 'package:smt_application/utils/app_colors.dart';
import 'package:smt_application/utils/app_sizes.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: RefreshIndicator(
        onRefresh: controller.getHomeContent,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              const HomeHeader(),
              const SizedBox(height: 20),
              const HomeSubCategory(),
              const SizedBox(height: 20),
              const OfferBannerWidget(),
              const SizedBox(height: 20),
              OfferRowChoice(controller: controller),
              const SizedBox(height: AppSize.s20),
              const BestDealTitleWidget(),
              const SizedBox(height: AppSize.s8),
              const BestDealWidgets(),
              const SizedBox(height: AppSize.s20),
              const DynamicBannerWidget(),
              const TopFlightsTitleWidets(),
              const TopFlightsWidgets(),
              const SizedBox(height: AppSize.s20),
              const SizedBox(height: AppSize.s20),
              const SizedBox(height: AppSize.s20),
              const SizedBox(height: AppSize.s20),
              const SizedBox(height: AppSize.s20),
            ],
          ),
        ),
      ),
    );
  }
}
