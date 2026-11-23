import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smt_application/src/modules/flights/controllers/flights_controller.dart';
import 'package:smt_application/src/modules/flights/controllers/search_airport_controller.dart';
import 'package:smt_application/src/modules/flights/models/flight_destination_model.dart';
import 'package:smt_application/src/modules/hotels/widgets/snackbar.dart';
import 'package:smt_application/utils/app_colors.dart';
import 'package:smt_application/generated/assets.dart';
import 'package:smt_application/src/modules/hotels/widgets/hotel_constants.dart';
import 'package:smt_application/utils/common_asset_image.dart';
import 'package:smt_application/utils/custom_textstyle.dart';

class CommonSearchScreen extends GetView<SearchAirportController> {
  const CommonSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 8),
              const CitySearchBar(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    RecentSearchItem(),
                    const SizedBox(height: 15),
                    Text(
                      HotelConstants.popularDestinationsTitle,
                      style: CustomTextstyle.bold600Text15,
                    ),
                    const SizedBox(height: 10),
                    const PopularDestinationsWidget(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CitySearchBar extends GetView<SearchAirportController> {
  const CitySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Get.back(),
            child: const CommonAssetImage(image: Assets.arrowLeft),
          ),
          const SizedBox(width: 14.5),
          Expanded(
            child: SizedBox(
              height: 44,
              child: TextFormField(
                controller: controller.searchController,
                decoration: InputDecoration(
                  hintText: HotelConstants.searchByCityAndProperty,
                  hintStyle: CustomTextstyle.normal400Text12,

                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  border: OutlineInputBorder(borderRadius: .circular(52)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: .circular(52),
                    borderSide: BorderSide(
                      color: AppColors.grey2.withValues(alpha: 0.3),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: .circular(52),
                    borderSide: const BorderSide(color: AppColors.textIconBlue),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RecentSearchItem extends GetView<FlightsController> {
  RecentSearchItem({super.key});
  final searchController = Get.find<SearchAirportController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final recentSearchItem = controller.recentSearch;

      if (recentSearchItem.isEmpty) {
        return const SizedBox.shrink();
      }

      return Column(
        children: [
          Row(
            children: [
              Text(
                HotelConstants.recentSearchTitle,
                style: CustomTextstyle.bold600Text15,
              ),
              const Spacer(),
              Text(
                HotelConstants.clear,
                style: CustomTextstyle.clearRecentSearch,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Column(
            children: List.generate(recentSearchItem.length, (index) {
              final searchDetail = recentSearchItem[index];
              final List<FlightDestinationModel> destination = [
                FlightDestinationModel(
                  city: searchDetail.fromCity.city,
                  airport: searchDetail.fromCity.airport,
                ),
                FlightDestinationModel(
                  city: searchDetail.toCity.city,
                  airport: searchDetail.toCity.airport,
                ),
              ];
              return GestureDetector(
                onTap: () {
                  controller.addRecentSearch();
                  searchController.selectRecentFlightDestination(
                    destination,
                    true,
                  );
                },
                child: SizedBox(
                  height: 48,
                  width: double.infinity,
                  child: Row(
                    children: [
                      const CommonAssetImage(image: Assets.time),
                      const SizedBox(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${searchDetail.fromCity.city} -> ${searchDetail.toCity.city}',
                            style: CustomTextstyle.boldText14Blue,
                          ),
                          Flexible(
                            child: Text(
                              "${searchDetail.departureDate} • ${searchDetail.travellers} Travellers • ${searchDetail.travelClass}",
                              style: CustomTextstyle.normal400Text12,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ],
      );
    });
  }
}

class PopularDestinationsWidget extends GetView<SearchAirportController> {
  const PopularDestinationsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final destinations = controller.filteredDestinations;

      return Column(
        children: List.generate(destinations.length, (index) {
          final destination = destinations[index];
          return PopularDestinationItem(
            city: destination.city,
            country: destination.airport,
            onTap: () {
              bool isAdded = controller.selectFlightDestination(destination);

              if (!isAdded) {
                AppSnackbar.showInfo(
                  "Already Selected ${destination.city}",
                  "Please Select Different or Another Airport",
                );
                return;
              }
              Get.back();
            },
          );
        }),
      );
    });
  }
}

class PopularDestinationGroup extends StatelessWidget {
  final String city;
  final String country;
  final List<String> subDestinations;

  const PopularDestinationGroup({
    super.key,
    required this.city,
    required this.country,
    required this.subDestinations,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PopularDestinationItem(city: city, country: country, onTap: () {}),
        Padding(
          padding: const EdgeInsets.only(left: 9),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: .stretch,
              children: [
                Container(
                  width: 1,
                  color: AppColors.grey2.withValues(alpha: 0.4),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      for (final destination in subDestinations)
                        SubDestinationItem(
                          title: destination,
                          subtitle: country,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class PopularDestinationItem extends StatelessWidget {
  final String city;
  final String country;
  final VoidCallback onTap;

  const PopularDestinationItem({
    super.key,
    required this.city,
    required this.country,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 42,
        child: Row(
          children: [
            const CommonAssetImage(image: Assets.flightFrom),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    city,
                    style: CustomTextstyle.boldText14Blue,
                    overflow: .ellipsis,
                    maxLines: 1,
                  ),
                  Text(
                    country,
                    style: CustomTextstyle.normal400Text12,
                    overflow: .ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SubDestinationItem extends StatelessWidget {
  final String title;
  final String subtitle;

  const SubDestinationItem({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: Column(
        crossAxisAlignment: .start,
        mainAxisAlignment: .center,
        children: [
          Text(title, style: CustomTextstyle.normalBlue12),
          Text(subtitle, style: CustomTextstyle.normal400Text10),
        ],
      ),
    );
  }
}
