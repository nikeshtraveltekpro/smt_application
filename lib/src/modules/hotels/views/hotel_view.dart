import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:smt_application/generated/assets.dart';
import 'package:smt_application/routes/app_pages.dart';
import 'package:smt_application/src/modules/hotels/controllers/calendar_controller.dart';
import 'package:smt_application/src/modules/hotels/enums/category_enum.dart';
import 'package:smt_application/src/modules/hotels/widgets/hotel_popular_destination_shimmer.dart';
import 'package:smt_application/src/modules/hotels/widgets/hotel_constants.dart';
import 'package:smt_application/src/modules/hotels/widgets/snackbar.dart';
import 'package:smt_application/utils/app_colors.dart';
import 'package:smt_application/utils/app_sizes.dart';
import 'package:smt_application/utils/common_asset_image.dart';
import 'package:smt_application/utils/custom_textstyle.dart';

import '../controllers/hotel_controller.dart';

class HotelView extends GetView<HotelController> {
  const HotelView({super.key, this.showHeader = true});
  final bool showHeader;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        scrollDirection: .vertical,
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            if (showHeader) ...[
              const SizedBox(height: 40),
              const CommonAppBar(screenName: HotelConstants.hotelSearchTitle),
              const SizedBox(height: 15),
              const CommonHeaderCategories(),
              const SizedBox(height: AppSize.s19),
            ],
            const HotelSearchWidget(),
            const HotelSearchButton(),
            Obx(() {
              if (controller.recentSearch.isEmpty) {
                return const SizedBox.shrink();
              }
              return const HotelRecentSearch();
            }),
            const SizedBox(height: AppSize.s20),

            const RefundableBannerWidget(),
            const HotelPopularDestinationWidget(),
            const SizedBox(height: AppSize.s34),

            const SizedBox(
              width: .infinity,
              child: CommonAssetImage(image: Assets.emptyScroll),
            ),
          ],
        ),
      ),
    );
  }
}

class HotelPopularDestinationWidget extends GetView<HotelController> {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        const SizedBox(height: AppSize.s20),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            HotelConstants.popularDestinationsTitle,
            style: CustomTextstyle.bold600Text15,
          ),
        ),
        const SizedBox(height: AppSize.s10),

        Obx(() {
          if (controller.isLoading.value) {
            return const HotelPopularDestinationShimmer();
          }
          if (controller.hasError.value) {
            return SizedBox(
              height: 139,
              child: Center(child: Text(controller.errorMsg.value)),
            );
          }

          return SingleChildScrollView(
            scrollDirection: .horizontal,
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: List.generate(controller.popularList.length, (index) {
                  final popular = controller.popularList[index];
                  return PopularDestinationCard(
                    image: popular.image,
                    country: popular.countryName,
                    city: popular.city,
                  );
                }),
              ),
            ),
          );
        }),
      ],
    );
  }
}

class PopularDestinationCard extends GetView<HotelController> {
  const new({
    super.key,
    required this.image,
    required this.country,
    required this.city,
  });
  final String image;
  final String country;
  final String city;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Container(
        height: 139.53488159179688,
        width: 139.53488159179688,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.white, width: 2),
          boxShadow: const [
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
                image,
                fit: .cover,
              ),
            ),
            Positioned(
              bottom: 9,
              left: 12,
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text(country, style: CustomTextstyle.bold500Text12White),
                  Text(city, style: CustomTextstyle.bold600Text18White),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RefundableBannerWidget extends GetView<HotelController> {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final descriptionParts = HotelConstants.refundableHotelsDescription.split(
      '100%',
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: SizedBox(
          height: 117,
          width: .infinity,
          child: Stack(
            children: [
              Container(color: AppColors.bannerDarkBlue),
              const Positioned(
                left: 229,
                top: -1.5,
                width: 122,
                height: 120,
                child: CommonAssetImage(
                  image: Assets.hotelBannerBg,
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 15.5,
                ),
                child: Column(
                  crossAxisAlignment: .start,
                  mainAxisAlignment: .spaceEvenly,
                  children: [
                    Text(
                      HotelConstants.refundableHotelsTitle,
                      style: CustomTextstyle.refundableBannerTitle,
                    ),
                    SizedBox(
                      width: 228,
                      height: 30,
                      child: Text.rich(
                        TextSpan(
                          children: [
                            if (descriptionParts.length > 1) ...[
                              TextSpan(text: descriptionParts.first),
                              const TextSpan(
                                text: '100%',
                                style: TextStyle(
                                  color: AppColors.red,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextSpan(
                                text: descriptionParts.sublist(1).join('100%'),
                              ),
                            ] else
                              const TextSpan(
                                text:
                                    HotelConstants.refundableHotelsDescription,
                              ),
                          ],
                        ),
                        style: CustomTextstyle.refundableBannerDescription,
                        maxLines: 2,
                        overflow: TextOverflow.clip,
                      ),
                    ),
                    Text(
                      HotelConstants.refundableHotelsExtraDescription,
                      style: CustomTextstyle.normalText8,
                    ),
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

class HotelRecentSearch extends GetView<HotelController> {
  const HotelRecentSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              HotelConstants.recentSearchesTitle,
              style: CustomTextstyle.bold600Text15,
            ),
          ),

          Obx(() {
            if (controller.recentSearch.isEmpty) {
              return const Padding(
                padding: EdgeInsets.only(left: 20, top: 15),
                child: Text('No recent searches'),
              );
            }

            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.only(top: 10, left: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(controller.recentSearch.length, (
                    index,
                  ) {
                    final recentSearchItem = controller.recentSearch[index];

                    return Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10,
                        ),
                        height: 76,
                        width: 164,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: AppColors.grey2.withValues(alpha: 0.14),
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              recentSearchItem.city,
                              style: CustomTextstyle.recentHotelCity,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),

                            Row(
                              children: [
                                Text(
                                  recentSearchItem.fullCheckIn,
                                  style: CustomTextstyle.normal400Text12,
                                ),
                                Text(
                                  ' - ',
                                  style: CustomTextstyle.normal400Text12,
                                ),
                                Text(
                                  recentSearchItem.fullCheckOut,
                                  style: CustomTextstyle.normal400Text12,
                                ),
                              ],
                            ),

                            Row(
                              children: [
                                Text(
                                  recentSearchItem.rooms,
                                  style: CustomTextstyle.normal500Text12,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 5,
                                  ),
                                  child: Container(
                                    height: 4,
                                    width: 4,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.grey2,
                                    ),
                                  ),
                                ),
                                Text(
                                  recentSearchItem.guests,
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
            );
          }),
        ],
      ),
    );
  }
}

class HotelSearchButton extends GetView<HotelController> {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: controller.addRecentSearch,
      child: Padding(
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
      ),
    );
  }
}

class HotelSearchWidget extends GetView<HotelController> {
  const HotelSearchWidget({super.key});

  final bool isSelected = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 281,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: AppColors.grey2.withValues(alpha: 0.14),
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Obx(
              () => CommonSearchWidget(
                onTap: () {
                  Get.toNamed(Routes.hotelSearchCity);
                },
                image: Assets.hotel,
                title: HotelConstants.hotelSearchLocationTitle,
                subTitle: controller.selectedCity.value,
                extraTitle: controller.country.value,
              ),
            ),

            Divider(
              height: 1,
              thickness: 1,
              color: AppColors.grey2.withValues(alpha: 0.14),
            ),

            const HotelSearchCheckInOutWidget(),

            Divider(
              height: 1,
              thickness: 1,
              color: AppColors.grey2.withValues(alpha: 0.14),
            ),

            const HomeRoomAndPriceWidget(),

            Divider(
              height: 1,
              thickness: 1,
              color: AppColors.grey2.withValues(alpha: 0.14),
            ),

            HotelQuickFiltersWidget(isSelected: isSelected),
          ],
        ),
      ),
    );
  }
}

class HotelQuickFiltersWidget extends GetView<HotelController> {
  const new({super.key, required this.isSelected});
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0),
      child: Column(
        crossAxisAlignment: .start,
        mainAxisAlignment: .spaceEvenly,
        children: [
          const SizedBox(height: 12),

          const Text(HotelConstants.quickFiltersTitle),
          const SizedBox(height: 6),

          Row(
            mainAxisAlignment: .start,

            children: [
              Obx(
                () => CommonToggleWidget(
                  isSelected: controller.is4Star.value,
                  onTap: controller.toggle4Star,
                ),
              ),

              const SizedBox(width: 4),

              Text(
                HotelConstants.fourStars,
                style: CustomTextstyle.hotelFilterLabel13,
              ),
              const SizedBox(width: 14),

              Obx(
                () => CommonToggleWidget(
                  isSelected: controller.isFullRefundable.value,
                  onTap: controller.toggleFullRefundable,
                ),
              ),

              const SizedBox(width: 4),

              Text(
                HotelConstants.fullRefundable,
                style: CustomTextstyle.hotelFilterLabel13,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CommonToggleWidget extends GetView<HotelController> {
  const new({super.key, required this.isSelected, this.onTap});

  final bool isSelected;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 31.999998092651367,
        height: 17.454544067382812,
        padding: const EdgeInsets.all(1.46),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.red : AppColors.grey200,
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
      ),
    );
  }
}

class HomeRoomAndPriceWidget extends GetView<HotelController> {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Expanded(
            child: Obx(
              () => CommonSearchWidget(
                onTap: controller.getRoomBottomSheet,
                image: Assets.room,
                title: HotelConstants.roomsAndGuestsTitle,
                subTitle: controller.selectedRoom.toString(),

                extraTitle: controller.selectedTotalPerson,
              ),
            ),
          ),

          VerticalDivider(
            width: 1,
            thickness: 1,
            color: AppColors.grey2.withValues(alpha: 0.14),
          ),

          Expanded(
            child: Obx(
              () => CommonSearchWidget(
                onTap: controller.getPriceBottomSheet,
                image: Assets.price,
                title: HotelConstants.pricePerNightTitle,
                subTitle: controller.selectedPrice.value != '0'
                    ? controller.selectedPrice.value
                    : HotelConstants.pricePerNightTitle,
                style: CustomTextstyle.bold500Text15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HotelSearchCheckInOutWidget extends GetView<CalendarController> {
  const HotelSearchCheckInOutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => IntrinsicHeight(
        child: Row(
          children: [
            Expanded(
              child: CommonSearchWidget(
                image: Assets.calendar,
                title: HotelConstants.checkInTitle,
                subTitle: controller.dateIn,
                extraTitle: DateFormat('EEEE').format(
                  controller.selectedDates.value.checkInDate ??
                      controller.today.value,
                ),
                onTap: () {
                  controller.openCalendar(isCheckIn: true);
                },
              ),
            ),

            VerticalDivider(
              width: 1,
              thickness: 1,
              color: AppColors.grey2.withValues(alpha: 0.14),
            ),

            Expanded(
              child: CommonSearchWidget(
                image: Assets.calendar,
                title: HotelConstants.checkOutTitle,
                subTitle: controller.dateOut,
                extraTitle: DateFormat('EEEE').format(
                  controller.selectedDates.value.checkOutDate ??
                      controller.today.value,
                ),
                onTap: () {
                  controller.openCalendar(isCheckIn: false);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CommonSearchWidget extends GetView<HotelController> {
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
                  Text(title, style: CustomTextstyle.normal500Text12),

                  Text(subTitle, style: style ?? CustomTextstyle.bold600Text15),

                  if (extraTitle != null && extraTitle!.isNotEmpty)
                    Text(
                      extraTitle!,
                      style: CustomTextstyle.normal500Text12,
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

class CommonAppBar extends GetView<HotelController> {
  const new({super.key, required this.screenName});
  final String screenName;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),

      child: Row(
        mainAxisAlignment: .start,
        crossAxisAlignment: .center,
        children: [
          GestureDetector(
            onTap: () => Get.offNamedUntil(Routes.home, (routes) => false),

            child: const CommonAssetImage(image: Assets.arrowLeft),
          ),
          const SizedBox(width: 14),
          Text(screenName, style: CustomTextstyle.boldText16),
        ],
      ),
    );
  }
}

class CommonHeaderCategories extends GetView<HotelController> {
  const new({
    super.key,
    this.selectedCategory,
    this.onCategorySelected,
  });

  final CategoryEnum? selectedCategory;
  final ValueChanged<CategoryEnum>? onCategorySelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: double.infinity,
        height: 54,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (
                var index = 0;
                index < CategoryEnum.values.length;
                index++
              ) ...[
                if (index > 0) const SizedBox(width: 5),
                CommonHeaderCategoriesCard(
                  item: CategoryEnum.values[index],
                  selectedCategory: selectedCategory,
                  onCategorySelected: onCategorySelected,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class CommonHeaderCategoriesCard extends GetView<HotelController> {
  const new({
    super.key,
    required this.item,
    this.selectedCategory,
    this.onCategorySelected,
  });

  final CategoryEnum item;
  final CategoryEnum? selectedCategory;
  final ValueChanged<CategoryEnum>? onCategorySelected;

  @override
  Widget build(BuildContext context) {
    final isSelected = selectedCategory == null
        ? '/${item.title.toLowerCase()}' == Get.currentRoute
        : selectedCategory == item;

    return InkWell(
      onTap: () {
        if (onCategorySelected != null) {
          if (item == CategoryEnum.hotels || item == CategoryEnum.flights) {
            onCategorySelected!(item);
          } else {
            AppSnackbar.showInfo(item.title, 'This category is coming soon.');
          }
          return;
        }
        if (item == CategoryEnum.hotels) {
          if (Get.currentRoute != Routes.hotel) {
            Get.toNamed(Routes.hotel);
          }
          return;
        }
        if (item == CategoryEnum.flights) {
          if (Get.currentRoute != Routes.trip) {
            Get.toNamed(Routes.trip);
          }
          return;
        }
        AppSnackbar.showInfo(item.title, 'This category is coming soon.');
      },
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: 56,
        height: 54,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isSelected ? AppColors.red : Colors.transparent,
              width: 2,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 6, 8, 6),
          child: Column(
            mainAxisAlignment: .center,
            children: [
              CommonAssetImage(
                image: item.icon,
                height: 18,
                width: 18,
                color: isSelected ? AppColors.red : AppColors.blue,
              ),
              const SizedBox(height: 6),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  item.title,
                  maxLines: 1,
                  style: CustomTextstyle.normalText12.copyWith(height: 1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
