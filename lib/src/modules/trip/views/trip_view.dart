import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smt_application/src/modules/flights/views/flights_view.dart';
import 'package:smt_application/src/modules/hotels/enums/category_enum.dart';
import 'package:smt_application/src/modules/hotels/views/hotel_view.dart';
import 'package:smt_application/src/modules/trip/controllers/trip_controller.dart';
import 'package:smt_application/utils/app_colors.dart';

class TripView extends GetView<TripController> {
  const TripView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Obx(
              () => CommonAppBar(
                screenName: controller.selectedIndex.value == 0
                    ? 'Flight Screen'
                    : 'Hotel Screen',
              ),
            ),
            const SizedBox(height: 15),
            Obx(
              () => CommonHeaderCategories(
                selectedCategory: controller.selectedIndex.value == 0
                    ? CategoryEnum.flights
                    : CategoryEnum.hotels,
                onCategorySelected: (category) {
                  controller.selectedIndex.value =
                      category == CategoryEnum.flights ? 0 : 1;
                },
              ),
            ),
            const SizedBox(height: 19),
            Expanded(
              child: Obx(
                () => controller.selectedIndex.value == 0
                    ? const SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: FlightsView(),
                      )
                    : const HotelView(showHeader: false),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
