import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smt_application/src/modules/home/controllers/home_controller.dart';
import 'package:smt_application/src/modules/home/widgets/shimmer/home_top_flights_shimmer.dart';
import 'package:smt_application/src/modules/home/widgets/top_flights_card.dart';

class TopFlightsWidgets extends GetView<HomeController> {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Obx(
        () => controller.isLoading.value
            ? GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 4,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 14,
                  crossAxisSpacing: 14,
                  childAspectRatio: 0.9,
                ),
                itemBuilder: (context, index) {
                  return HomeTopFlightsShimmer();
                },
              )
            : GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller.homeTopFlights.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 14,
                  crossAxisSpacing: 14,
                  childAspectRatio: 0.9,
                ),
                itemBuilder: (context, index) {
                  final topFlight = controller.homeTopFlights[index];
                  return TopFlightsCard(topFlight: topFlight);
                },
              ),
      ),
    );
  }
}
