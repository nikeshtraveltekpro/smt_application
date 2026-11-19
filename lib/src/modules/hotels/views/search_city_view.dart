import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smt_application/generated/assets.dart';
import 'package:smt_application/src/modules/hotels/controllers/search_city_controller.dart';
import 'package:smt_application/src/modules/hotels/widgets/hotel_constants.dart';
import 'package:smt_application/utils/app_colors.dart';
import 'package:smt_application/utils/common_asset_image.dart';
import 'package:smt_application/utils/custom_textstyle.dart';

class SearchCityView extends GetView<SearchCityController> {
  const SearchCityView({super.key});

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
                          style: CustomTextstyle.normal400Text12Red.copyWith(
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.red,
                          ),
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
                      color: AppColors.grey_2.withValues(alpha: 0.3),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: .circular(52),
                    borderSide: BorderSide(color: AppColors.text_icon_blue),
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
              color: AppColors.grey_2.withValues(alpha: 0.14),
            ),
          ),
        ),
        child: Row(
          children: [
            CommonAssetImage(image: Assets.locationCursor),
            SizedBox(width: 10),
            Text(
              HotelConstants.propertiesNearMe,
              style: CustomTextstyle.bold500Text15.copyWith(
                fontSize: 14,
                color: AppColors.text_icon_blue,
              ),
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
    return SizedBox(
      height: 48,
      width: .infinity,
      child: Row(
        children: [
          CommonAssetImage(image: Assets.time),
          SizedBox(width: 10),
          Column(
            mainAxisAlignment: .center,
            crossAxisAlignment: .start,
            children: [
              Text(
                HotelConstants.hotelRecentSearchFullName,
                style: CustomTextstyle.bold600Text14.copyWith(
                  color: AppColors.text_icon_blue,
                ),
              ),
              Text(
                HotelConstants.recentSearchCity,
                style: CustomTextstyle.normal400Text12,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PopularDestinationsWidget extends GetView<SearchCityController> {
  const PopularDestinationsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PopularDestinationGroup(
          city: HotelConstants.recentSearchCity,
          country: HotelConstants.recentSearchCity,
          subDestinations: [
            HotelConstants.recentSearchCity,
            HotelConstants.recentSearchCity,
            HotelConstants.recentSearchCity,
            HotelConstants.recentSearchCity,
            HotelConstants.recentSearchCity,
          ],
        ),
        SizedBox(height: 10),
        PopularDestinationItem(
          city: HotelConstants.recentSearchCity,
          country: HotelConstants.recentSearchCity,
        ),
        SizedBox(height: 10),

        PopularDestinationItem(
          city: HotelConstants.recentSearchCity,
          country: HotelConstants.recentSearchCity,
        ),
        SizedBox(height: 10),

        PopularDestinationItem(
          city: HotelConstants.recentSearchCity,
          country: HotelConstants.recentSearchCity,
        ),
        SizedBox(height: 10),
        PopularDestinationItem(
          city: HotelConstants.recentSearchCity,
          country: HotelConstants.recentSearchCity,
        ),
      ],
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
        PopularDestinationItem(city: city, country: country),
        Padding(
          padding: EdgeInsets.only(left: 9),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: .stretch,
              children: [
                Container(
                  width: 1,
                  color: AppColors.grey_2.withValues(alpha: 0.4),
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

  const PopularDestinationItem({
    super.key,
    required this.city,
    required this.country,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      child: Row(
        children: [
          CommonAssetImage(image: Assets.hotelIcon),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: .center,
              crossAxisAlignment: .start,
              children: [
                Text(
                  city,
                  style: CustomTextstyle.bold600Text14.copyWith(
                    color: AppColors.text_icon_blue,
                  ),
                ),
                Text(country, style: CustomTextstyle.normal400Text12),
              ],
            ),
          ),
        ],
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
          Text(
            title,
            style: CustomTextstyle.normal400Text12.copyWith(
              color: AppColors.text_icon_blue,
            ),
          ),
          Text(
            subtitle,
            style: CustomTextstyle.normal400Text12.copyWith(fontSize: 10),
          ),
        ],
      ),
    );
  }
}
