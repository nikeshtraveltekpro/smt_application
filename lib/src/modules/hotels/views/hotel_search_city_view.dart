import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smt_application/generated/assets.dart';
import 'package:smt_application/src/modules/hotels/controllers/search_city_controller.dart';
import 'package:smt_application/src/modules/hotels/widgets/hotel_constants.dart';
import 'package:smt_application/utils/app_colors.dart';
import 'package:smt_application/utils/common_asset_image.dart';
import 'package:smt_application/utils/custom_textstyle.dart';

class HotelSearchCityView extends GetView<SearchCityController> {
  const HotelSearchCityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 8),
              CitySearchBar(),
              SizedBox(height: 18),
              LocationNearMeWidget(),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Row(
                      children: [
                        Text(
                          HotelConstants.recentSearchTitle,
                          style: CustomTextstyle.bold600Text15,
                        ),
                        Spacer(),
                        Text(
                          HotelConstants.clear,
                          style: CustomTextstyle.clearRecentSearch,
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    RecentSearchItem(),
                    SizedBox(height: 15),
                    Text(
                      HotelConstants.popularDestinationsTitle,
                      style: CustomTextstyle.bold600Text15,
                    ),
                    SizedBox(height: 10),
                    PopularDestinationsWidget(),
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

class CitySearchBar extends GetView<SearchCityController> {
  const CitySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Get.back(),
            child: CommonAssetImage(image: Assets.arrowLeft),
          ),
          SizedBox(width: 14.5),
          Expanded(
            child: SizedBox(
              height: 44,
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: HotelConstants.searchByCityAndProperty,
                  hintStyle: CustomTextstyle.normal400Text12,

                  contentPadding: EdgeInsets.symmetric(
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
                    borderSide: BorderSide(color: AppColors.textIconBlue),
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

class LocationNearMeWidget extends GetView<SearchCityController> {
  const LocationNearMeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: controller.selectNearMe,
      child: Container(
        height: 65,
        width: .infinity,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.symmetric(
            horizontal: BorderSide(
              width: 1,
              color: AppColors.grey2.withValues(alpha: 0.14),
            ),
          ),
        ),
        child: Row(
          children: [
            CommonAssetImage(image: Assets.locationCursor),
            SizedBox(width: 10),
            Text(
              HotelConstants.propertiesNearMe,
              style: CustomTextstyle.normalText14,
            ),
          ],
        ),
      ),
    );
  }
}

class RecentSearchItem extends GetView<SearchCityController> {
  const RecentSearchItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.recentCitySearches.isEmpty) {
        return const SizedBox.shrink();
      }

      return Column(
        children: List.generate(controller.recentCitySearches.length, (index) {
          final city = controller.recentCitySearches[index];

          return GestureDetector(
            onTap: () {
              controller.selectDestination(city);
            },
            child: SizedBox(
              height: 48,
              width: double.infinity,
              child: Row(
                children: [
                  CommonAssetImage(image: Assets.time),
                  const SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(city.title, style: CustomTextstyle.boldText14Blue),
                      Text(
                        city.subtitle,
                        style: CustomTextstyle.normal400Text12,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }),
      );
    });
  }
}

class PopularDestinationsWidget extends GetView<SearchCityController> {
  const PopularDestinationsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: List.generate(controller.filteredDestinations.length, (
          index,
        ) {
          final destination = controller.filteredDestinations[index];

          return PopularDestinationItem(
            city: destination.subtitle,
            country: destination.title,
            onTap: () {
              controller.selectDestination(destination);
            },
          );
        }),
      ),
    );
  }
}

class PopularDestinationGroup extends GetView<SearchCityController> {
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
          padding: EdgeInsets.only(left: 9),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: .stretch,
              children: [
                Container(
                  width: 1,
                  color: AppColors.grey2.withValues(alpha: 0.4),
                ),
                SizedBox(width: 20),
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

class PopularDestinationItem extends GetView<SearchCityController> {
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
            CommonAssetImage(image: Assets.hotelIcon),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(city, style: CustomTextstyle.boldText14Blue),
                  Text(country, style: CustomTextstyle.normal400Text12),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SubDestinationItem extends GetView<SearchCityController> {
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
