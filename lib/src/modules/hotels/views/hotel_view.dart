import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:smt_application/generated/assets.dart';
import 'package:smt_application/routes/app_pages.dart';
import 'package:smt_application/src/modules/hotels/enums/category_enum.dart';
import 'package:smt_application/src/modules/hotels/widgets/hotel_constants.dart';
import 'package:smt_application/utils/app_colors.dart';
import 'package:smt_application/utils/app_sizes.dart';
import 'package:smt_application/utils/common_asset_image.dart';
import 'package:smt_application/utils/custom_textstyle.dart';

import '../controllers/hotel_controller.dart';

class HotelView extends GetView<HotelController> {
  const HotelView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        scrollDirection: .vertical,
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: 35),
            HotelAppBar(),
            SizedBox(height: 15),

            HotelHeaderCategories(),
            SizedBox(height: AppSize.s19),
            HotelSearchWidget(),
            HotelSearchButton(),
            HotelRecentSearch(),
            SizedBox(height: AppSize.s20),

            RefundableBannerWidget(),
            HotelPopularDestinationWidget(),
            SizedBox(height: AppSize.s34),

            SizedBox(
              width: .infinity,
              child: CommonAssetImage(image: Assets.emptyScroll),
            ),
          ],
        ),
      ),
    );
  }
}

class HotelPopularDestinationWidget extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        SizedBox(height: AppSize.s20),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            HotelConstants.popularDestinationsTitle,
            style: CustomTextstyle.bold600Text15,
          ),
        ),
        SizedBox(height: AppSize.s10),

        SingleChildScrollView(
          scrollDirection: .horizontal,
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: List.generate(5, (index) {
                return PopularDestinationCard();
              }),
            ),
          ),
        ),
      ],
    );
  }
}

class PopularDestinationCard extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Container(
        height: 139.53488159179688,
        width: 139.53488159179688,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: AppColors.black,
              blurRadius: 3,
              offset: Offset(0, 1),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),

              child: Image.network(
                height: 139.53488159179688,
                width: 139.53488159179688,
                "https://www.annees-de-pelerinage.com/wp-content/uploads/2018/09/tirta-empul-water-temple-hindu-bali-indonesia.jpg",
                fit: .cover,
              ),
            ),
            Positioned(
              bottom: 9,
              left: 12,
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text(
                    HotelConstants.destinationCountry,
                    style: CustomTextstyle.bold500Text12White,
                  ),
                  Text(
                    HotelConstants.destinationCity,
                    style: CustomTextstyle.bold600Text18White,
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

class RefundableBannerWidget extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15.5),
        height: 117,
        width: .infinity,
        decoration: BoxDecoration(
          color: AppColors.banner_dark_blue,
          borderRadius: .circular(16),
        ),
        child: Column(
          crossAxisAlignment: .start,
          mainAxisAlignment: .spaceEvenly,
          children: [
            Text(
              HotelConstants.refundableHotelsTitle,
              style: CustomTextstyle.bold600Text16,
            ),
            Text(
              HotelConstants.refundableHotelsDescription,
              style: CustomTextstyle.bold500Text10,
            ),
            Text(
              HotelConstants.refundableHotelsExtraDescription,
              style: CustomTextstyle.normalText8,
            ),
          ],
        ),
      ),
    );
  }
}

class HotelRecentSearch extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: .start,
      crossAxisAlignment: .start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            HotelConstants.recentSearchesTitle,
            style: CustomTextstyle.bold600Text15,
          ),
        ),
        SingleChildScrollView(
          scrollDirection: .horizontal,
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(top: 10, left: 20),
            child: Row(
              children: List.generate(4, (index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Container(
                    padding: .symmetric(horizontal: 15, vertical: 10),
                    height: 76,
                    width: 164,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: AppColors.grey_2.withValues(alpha: 0.14),
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        Text(
                          HotelConstants.recentSearchCity,
                          style: CustomTextstyle.bold600Text15.copyWith(
                            fontSize: 13,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: .start,

                          children: [
                            Text(
                              HotelConstants.recentSearchDateIn,

                              style: CustomTextstyle.normal400Text12,
                            ),
                            Text(" - ", style: CustomTextstyle.normal400Text12),
                            Text(
                              HotelConstants.recentSearchDateOut,
                              style: CustomTextstyle.normal400Text12,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: .start,
                          children: [
                            Text(
                              HotelConstants.recentSearchGuestsRoom,
                              style: CustomTextstyle.normal500Text12,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Container(
                                height: 4,
                                width: 4,
                                decoration: BoxDecoration(
                                  shape: .circle,
                                  color: AppColors.grey_2,
                                ),
                              ),
                            ),
                            Text(
                              HotelConstants.recentSearchTotalGuests,

                              style: CustomTextstyle.normal500Text12,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}

class HotelSearchButton extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
      child: Container(
        height: 44,
        width: .infinity,
        decoration: BoxDecoration(
          color: AppColors.red,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            HotelConstants.searchHotelsButton,
            style: CustomTextstyle.bold600Text14,
          ),
        ),
      ),
    );
  }
}

class HotelSearchWidget extends StatelessWidget {
  const new({super.key});
  final bool isSelected = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),

      child: Container(
        height: 281,
        width: .infinity,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: AppColors.grey_2.withValues(alpha: 0.14),
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: .start,
          children: [
            CommonSearchWidget(
              onTap: () {
                print("=======================Search Tapped===================");
                Get.toNamed(Routes.hotelSearchCity);
              },
              image: Assets.hotel,
              title: HotelConstants.hotelSearchLocationTitle,
              subTitle: HotelConstants.hotelSearchCityName,
              extraTitle: HotelConstants.hotelSearchCountryName,
            ),
            Divider(
              height: 1,
              thickness: 1,
              color: AppColors.grey_2.withValues(alpha: 0.14),
            ),

            HotelSearchCheckInOutWidget(),
            Divider(
              height: 1,
              thickness: 1,
              color: AppColors.grey_2.withValues(alpha: 0.14),
            ),
            HomeRoomAndPriceWidget(),
            Divider(
              height: 1,
              thickness: 1,
              color: AppColors.grey_2.withValues(alpha: 0.14),
            ),
            HotelQuickFiltersWidget(isSelected: isSelected),
          ],
        ),
      ),
    );
  }
}

class HotelQuickFiltersWidget extends StatelessWidget {
  const new({super.key, required this.isSelected});
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, top: 12),
      child: Column(
        crossAxisAlignment: .start,
        mainAxisAlignment: .start,
        children: [
          Text(HotelConstants.quickFiltersTitle),

          Row(
            mainAxisAlignment: .start,
            children: [
              CommonToggleWidget(isSelected: isSelected),

              SizedBox(width: 4),

              Text(
                HotelConstants.fourStars,
                style: CustomTextstyle.bold500Text15.copyWith(
                  color: AppColors.textGreyColor,
                  fontSize: 13,
                ),
              ),
              SizedBox(width: 14),

              CommonToggleWidget(isSelected: isSelected),

              SizedBox(width: 4),

              Text(
                HotelConstants.fullRefundable,
                style: CustomTextstyle.bold500Text15.copyWith(
                  color: AppColors.textGreyColor,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CommonToggleWidget extends StatelessWidget {
  const new({super.key, required this.isSelected});

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 31.999998092651367,
      height: 17.454544067382812,
      padding: const EdgeInsets.all(1.46),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.red : AppColors.grey_2,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Align(
        alignment: isSelected ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          width: 14.545454025268555,
          height: 14.545454025268555,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}

class HomeRoomAndPriceWidget extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Expanded(
            child: CommonSearchWidget(
              image: Assets.room,
              title: HotelConstants.roomsAndGuestsTitle,
              subTitle: HotelConstants.roomCount,
              extraTitle: HotelConstants.guestCount,
            ),
          ),

          VerticalDivider(
            width: 1,
            thickness: 1,
            color: AppColors.grey_2.withValues(alpha: 0.14),
          ),

          Expanded(
            child: CommonSearchWidget(
              image: Assets.price,
              title: HotelConstants.pricePerNightTitle,
              subTitle: HotelConstants.selectPrice,
              style: CustomTextstyle.bold500Text15,
            ),
          ),
        ],
      ),
    );
  }
}

class HotelSearchCheckInOutWidget extends StatelessWidget {
  const HotelSearchCheckInOutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Expanded(
            child: CommonSearchWidget(
              image: Assets.calendar,
              title: HotelConstants.checkInTitle,
              subTitle: HotelConstants.checkInDate,
              extraTitle: HotelConstants.checkInDay,
            ),
          ),

          VerticalDivider(
            width: 1,
            thickness: 1,
            color: AppColors.grey_2.withValues(alpha: 0.14),
          ),

          Expanded(
            child: CommonSearchWidget(
              image: Assets.calendar,
              title: HotelConstants.checkOutTitle,
              subTitle: HotelConstants.checkOutDate,
              extraTitle: HotelConstants.checkOutDay,
            ),
          ),
        ],
      ),
    );
  }
}

class CommonSearchWidget extends StatelessWidget {
  const CommonSearchWidget({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    this.extraTitle,
    this.style,
    this.onTap,
  });

  final String image;
  final String title;
  final String subTitle;
  final String? extraTitle;
  final TextStyle? style;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          crossAxisAlignment: .center,
          children: [
            CommonAssetImage(
              image: image,
              height: 20,
              width: 20,
              color: AppColors.blue,
            ),

            const SizedBox(width: 8),

            Expanded(
              child: Column(
                mainAxisAlignment: .center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: CustomTextstyle.normal400Text12.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.textGreyColor,
                    ),
                  ),

                  Text(subTitle, style: style ?? CustomTextstyle.bold600Text15),

                  if (extraTitle != null && extraTitle!.isNotEmpty)
                    Text(
                      extraTitle!,
                      style: CustomTextstyle.normal400Text12.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.textGreyColor,
                      ),
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

class HotelAppBar extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),

      child: Row(
        mainAxisAlignment: .start,
        crossAxisAlignment: .center,
        children: [
          GestureDetector(
            onTap: () => Get.back(),
            child: CommonAssetImage(image: Assets.arrowLeft),
          ),
          SizedBox(width: 14),
          Text(
            HotelConstants.hotelSearchTitle,
            style: CustomTextstyle.boldText16,
          ),
        ],
      ),
    );
  }
}

class HotelHeaderCategories extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),

      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: CategoryEnum.values.map((item) {
          return HotelHeaderCategoriesCard(item: item);
        }).toList(),
      ),
    );
  }
}

class HotelHeaderCategoriesCard extends StatelessWidget {
  const new({super.key, required this.item});
  final CategoryEnum item;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: Column(
        children: [
          Expanded(
            child: CommonAssetImage(
              image: item.icon,
              height: 18,
              width: 18,
              color: item.title == HotelConstants.hotels
                  ? AppColors.red
                  : AppColors.blue,
            ),
          ),
          Expanded(
            child: Text(item.title, style: CustomTextstyle.normalText12),
          ),
          if (item.title == HotelConstants.hotels)
            Align(
              alignment: .center,
              child: Container(width: 22, height: 2, color: AppColors.red),
            ),
        ],
      ),
    );
  }
}
