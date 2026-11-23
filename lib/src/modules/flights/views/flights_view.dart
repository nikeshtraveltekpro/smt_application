import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:smt_application/generated/assets.dart';
import 'package:smt_application/routes/app_pages.dart';
import 'package:smt_application/src/modules/flights/controllers/flight_calendar_controller.dart';
import 'package:smt_application/src/modules/flights/controllers/search_airport_controller.dart';
import 'package:smt_application/src/modules/flights/models/flight_destination_model.dart';
import 'package:smt_application/src/modules/flights/models/flight_popular_routes_model.dart';
import 'package:smt_application/src/modules/flights/views/flight_bottom_sheet.dart';
import 'package:smt_application/src/modules/flights/widgets/flight_constants.dart';
import 'package:smt_application/src/modules/hotels/views/hotel_view.dart';
import 'package:smt_application/src/modules/hotels/widgets/snackbar.dart';
import 'package:smt_application/utils/app_colors.dart';
import 'package:smt_application/utils/common_asset_image.dart';
import 'package:smt_application/utils/custom_textstyle.dart';

import '../controllers/flights_controller.dart';

class FlightsView extends GetView<FlightsController> {
  const FlightsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FlightWaySelectionWidget(),
        const SizedBox(height: 10),
        Obx(
          () => FlightSearchWidget(
            controller: controller,
            isOneWay: controller.isOneWay.value,
          ),
        ),

        const SizedBox(height: 15),

        const FlightSearchButton(),

        Obx(() {
          if (controller.recentSearch.isEmpty) {
            return const SizedBox.shrink();
          }
          return FlightRecentSearch();
        }),
        const SizedBox(height: 20),

        const ExclusiveFlightBenefitsBanner(backgroundImage: Assets.bannerLink),

        const SizedBox(height: 15),
        PopularRoutesWidget(controller: controller),

        const CommonAssetImage(image: Assets.blankPlaceholder),
      ],
    );
  }
}

class PopularRoutesWidget extends StatelessWidget {
  const new({super.key, required this.controller});

  final FlightsController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.gradientBlue, AppColors.gradientWhite],
          begin: .topLeft,
          end: .bottomRight,
        ),
      ),
      padding: const EdgeInsets.only(top: 20, left: 20),
      width: .infinity,
      height: 341,
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Container(
            padding: const .only(right: 36),
            height: 59,
            width: .infinity,
            child: Column(
              crossAxisAlignment: .start,

              children: [
                Text(
                  FlightConstants.popularRoutes,
                  style: CustomTextstyle.bold600Text15,
                ),
                const SizedBox(height: 4),
                Text(
                  FlightConstants.popularRoutesSubtitle,
                  style: CustomTextstyle.bold500Text12,
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 225,
            child: GridView.builder(
              itemCount: controller.popularRoutes.length,

              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                mainAxisExtent: 322,
              ),
              scrollDirection: .horizontal,
              itemBuilder: (context, index) {
                final popularItem = controller.popularRoutes[index];
                return PopularRoutesItemWidgets(popularItem: popularItem);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class PopularRoutesItemWidgets extends StatelessWidget {
  const new({super.key, required this.popularItem});

  final FlightPopularRoutesModel popularItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: .circular(12),
        color: AppColors.white,
        border: Border.all(
          width: 1,
          color: AppColors.grey.withValues(alpha: 0.5),
        ),
      ),
      width: 322,
      height: 67,
      child: Row(
        mainAxisAlignment: .start,
        children: [
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.lightBlue1.withValues(alpha: 0.2),
              borderRadius: .circular(13),
            ),
            width: 45,
            height: 45,
            child: const CommonAssetImage(
              width: 22.5,
              height: 22.5,
              image: Assets.planeUp,
              color: AppColors.textIconBlue,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 13.5),
              child: Column(
                crossAxisAlignment: .start,

                children: [
                  Text(
                    '${popularItem.fromCity} to ${popularItem.toCity}',
                    style: CustomTextstyle.boldText14Blue,
                    overflow: .ellipsis,
                    maxLines: 1,
                  ),
                  Text(
                    '${popularItem.fromCityCode} -> ${popularItem.toCityCode}',
                    style: CustomTextstyle.boldText12Green,
                    overflow: .ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FlightRecentSearch extends GetView<FlightsController> {
  FlightRecentSearch({super.key});
  SearchAirportController get searchController =>
      Get.isRegistered<SearchAirportController>()
      ? Get.find<SearchAirportController>()
      : Get.put(SearchAirportController());

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
              FlightConstants.recentSearches,
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
                    final totalTravellers = recentSearchItem.travellers;
                    String traveller = "Travellers";
                    if (totalTravellers <= 1) {
                      traveller = "Traveller";
                    }
                    final List<FlightDestinationModel> destination = [
                      FlightDestinationModel(
                        city: recentSearchItem.fromCity.city,
                        airport: recentSearchItem.fromCity.airport,
                      ),
                      FlightDestinationModel(
                        city: recentSearchItem.toCity.city,
                        airport: recentSearchItem.toCity.airport,
                      ),
                    ];
                    return GestureDetector(
                      onTap: () => searchController
                          .selectRecentFlightDestination(destination, false),

                      child: Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: Container(
                          padding: const EdgeInsets.only(left: 15, top: 10),
                          height: 54,
                          width: 206,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: AppColors.grey2.withValues(alpha: 0.14),
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Text(
                                  "${recentSearchItem.fromCity.city} - ${recentSearchItem.toCity.city}",
                                  style: CustomTextstyle.recentHotelCity,
                                ),
                              ),

                              Flexible(
                                child: Text(
                                  "${recentSearchItem.departureDate} • ${recentSearchItem.travellers} $traveller • ${recentSearchItem.travelClass}",
                                  style: CustomTextstyle.normal400Text12,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
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

class ExclusiveFlightBenefitsBanner extends GetView<FlightsController> {
  const ExclusiveFlightBenefitsBanner({
    super.key,
    required this.backgroundImage,
    this.title = FlightConstants.exclusiveFlightBenefitsTitle,
    this.onTap,
  });

  final String backgroundImage;
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 120,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.network(backgroundImage, fit: .cover),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(18, 10, 18, 10),
                child: Column(
                  crossAxisAlignment: .start,
                  mainAxisSize: .min,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: .w600,
                        fontSize: 16,
                        height: 1.3,
                        color: AppColors.white,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 4.56,
                      runSpacing: 4.56,
                      children: controller.benefits
                          .map((benefit) => BenefitPill(label: benefit))
                          .toList(),
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

class BenefitPill extends StatelessWidget {
  const BenefitPill({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(26.62),
      child: Container(
        width: 101,
        height: 19,
        padding: const EdgeInsets.fromLTRB(10.65, 2.65, 10.65, 2.65),
        decoration: BoxDecoration(
          color: AppColors.white.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(26.62),

          border: Border.all(
            color: AppColors.grey.withValues(alpha: 0.2),
            width: 1,
          ),
        ),
        child: Center(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(label, style: CustomTextstyle.regular400Text9),
          ),
        ),
      ),
    );
  }
}

class FlightSearchWidget extends StatelessWidget {
  FlightSearchWidget({
    super.key,
    required this.controller,
    required this.isOneWay,
  });

  final FlightsController controller;
  final bool isOneWay;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const .symmetric(horizontal: 20),
      child: Container(
        height: 404,
        width: .infinity,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: AppColors.grey2.withValues(alpha: 0.14),
          ),
          borderRadius: .circular(16),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Column(
                  children: [
                    Obx(() {
                      final showAlert =
                          controller.isSelectedFrom.value &&
                          controller.selectedFromCity.value ==
                              FlightConstants.searchSelectCity;

                      return showAlert
                          ? AlertCommonFlightSearchWidget(
                              onTap: () {
                                Get.toNamed(
                                  Routes.searchFlights,
                                  arguments: true,
                                );
                              },
                              image: Assets.flightFrom,
                              borderRadius: const BorderRadius.only(
                                topLeft: .circular(12),
                                topRight: .circular(12),
                              ),
                              title: FlightConstants.from,
                              subTitle: controller.selectedFromCity.value,
                              extraTitle: controller.selectedFromAirport.value,
                            )
                          : CommonFlightSearchWidget(
                              onTap: () {
                                Get.toNamed(
                                  Routes.searchFlights,
                                  arguments: true,
                                );
                              },
                              image: Assets.flightFrom,

                              title: FlightConstants.from,
                              subTitle: controller.selectedFromCity.value,
                              extraTitle: controller.selectedFromAirport.value,
                            );
                    }),
                    Obx(() {
                      final showAlert =
                          controller.isSelectedFrom.value &&
                              controller.selectedFromCity.value ==
                                  FlightConstants.searchSelectCity ||
                          controller.isSelectedTo.value &&
                              controller.selectedToCity.value ==
                                  FlightConstants.searchSelectCity;
                      return Divider(
                        height: 1,
                        thickness: 1,
                        color: showAlert
                            ? Colors.red
                            : AppColors.grey2.withValues(alpha: 0.14),
                      );
                    }),

                    Obx(() {
                      final showAlert =
                          controller.isSelectedTo.value &&
                          controller.selectedToCity.value ==
                              FlightConstants.searchSelectCity;

                      return showAlert
                          ? AlertCommonFlightSearchWidget(
                              onTap: () {
                                Get.toNamed(
                                  Routes.searchFlights,
                                  arguments: false,
                                );
                              },
                              border: .fromLTRB(
                                left: BorderSide(
                                  color: AppColors.red,
                                  width: 1,
                                ),
                                right: BorderSide(
                                  color: AppColors.red,
                                  width: 1,
                                ),
                                bottom: BorderSide(
                                  color: AppColors.red,
                                  width: 1,
                                ),
                              ),
                              image: Assets.flightTo,
                              title: FlightConstants.to,
                              subTitle: controller.selectedToCity.value,
                              extraTitle: controller.selectedToAirport.value,
                            )
                          : CommonFlightSearchWidget(
                              onTap: () {
                                Get.toNamed(
                                  Routes.searchFlights,
                                  arguments: false,
                                );
                              },
                              image: Assets.flightTo,
                              title: FlightConstants.to,
                              subTitle: controller.selectedToCity.value,
                              extraTitle: controller.selectedToAirport.value,
                            );
                    }),
                  ],
                ),
                Positioned(
                  top: 62,
                  right: 16,
                  child: GestureDetector(
                    onTap: controller.onSwapTap,
                    child: Container(
                      padding: const .symmetric(horizontal: 7, vertical: 5),
                      height: 32,
                      width: 32,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.grey2.withValues(alpha: 0.25),
                          width: 1,
                        ),
                      ),
                      child: const CommonAssetImage(
                        image: Assets.arrowUpDown,
                        width: 20,
                        height: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              height: 1,
              thickness: 1,
              color: AppColors.grey2.withValues(alpha: 0.14),
            ),
            FlightDepartureArrivalWidget(),
            Divider(
              height: 1,
              thickness: 1,
              color: AppColors.grey2.withValues(alpha: 0.14),
            ),
            Obx(
              () => CommonFlightSearchWidget(
                onTap: () {
                  Get.bottomSheet(
                    const TravellersClassBottomsheet(),
                    isScrollControlled: true,
                  );
                },
                image: Assets.persons,
                title: FlightConstants.travellersAndClass,
                subTitle:
                    "${controller.totalTravellers} ${FlightConstants.travellers}",
                extraTitle: controller.selectedCabinClass.value,
              ),
            ),
            Divider(
              height: 1,
              thickness: 1,
              color: AppColors.grey2.withValues(alpha: 0.14),
            ),
            const FlightSpecialFaresFiltersWidget(),
          ],
        ),
      ),
    );
  }
}

class FlightDepartureArrivalWidget extends GetView<FlightCalendarController> {
  FlightDepartureArrivalWidget({super.key});

  final FlightsController flightController = Get.find<FlightsController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final departureDate =
          controller.selectedDepartureDate.value ?? DateTime.now();
      final normalizedDeparture = controller.normalizeDate(departureDate);
      final arrivalDate =
          controller.selectedReturnDate.value ??
          normalizedDeparture.add(const Duration(days: 1));

      return IntrinsicHeight(
        child: Row(
          children: [
            Expanded(
              child: CommonSearchWidget(
                image: Assets.calendar,
                title: FlightConstants.departure,
                subTitle: DateFormat('dd MMM yyyy').format(normalizedDeparture),
                extraTitle: DateFormat('EEEE').format(normalizedDeparture),
                onTap: () {
                  controller.openCalendar(isDeparture: true);
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
                title: FlightConstants.arrival,
                subTitle: flightController.isOneWay.value
                    ? FlightConstants.addArrival
                    : DateFormat('dd MMM yyyy').format(arrivalDate),
                extraTitle: flightController.isOneWay.value
                    ? ''
                    : DateFormat('EEEE').format(arrivalDate),
                style: flightController.isOneWay.value
                    ? CustomTextstyle.bold600Text15Grey
                    : null,
                onTap: () {
                  if (flightController.isOneWay.value) {
                    AppSnackbar.showInfo("Notice", "Supported In Round Trip");
                  } else {
                    controller.openCalendar(isDeparture: false);
                  }
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}

class CommonFlightSearchWidget extends GetView<FlightsController> {
  const CommonFlightSearchWidget({
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
      child: SizedBox(
        height: 73,

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            crossAxisAlignment: .center,
            children: [
              CommonAssetImage(
                image: image,
                height: 20,
                width: 20,
                color: AppColors.textIconBlue,
              ),

              const SizedBox(width: 8),

              Expanded(
                child: Column(
                  mainAxisAlignment: .center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: CustomTextstyle.normal500Text12),

                    Text(
                      subTitle,
                      style: style ?? CustomTextstyle.bold600Text15,
                    ),

                    if (extraTitle != null && extraTitle!.isNotEmpty)
                      Text(
                        extraTitle!,
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
      ),
    );
  }
}

class AlertCommonFlightSearchWidget extends GetView<FlightsController> {
  const AlertCommonFlightSearchWidget({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    this.extraTitle,
    this.style,
    this.onTap,
    this.borderRadius,
    this.border,
  });

  final String image;
  final String title;
  final String subTitle;
  final String? extraTitle;
  final TextStyle? style;
  final void Function()? onTap;
  final BorderRadiusGeometry? borderRadius;
  final BoxBorder? border;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 78,
        decoration: BoxDecoration(
          color: AppColors.red.withValues(alpha: 0.08),
          borderRadius:
              borderRadius ??
              const BorderRadius.only(topLeft: Radius.circular(0)),
          border:
              border ??
              .fromLTRB(
                left: BorderSide(color: AppColors.red, width: 1),
                right: BorderSide(color: AppColors.red, width: 1),
                top: BorderSide(color: AppColors.red, width: 1),
              ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Column(
            mainAxisAlignment: .spaceBetween,
            crossAxisAlignment: .start,
            children: [
              Row(
                crossAxisAlignment: .center,
                children: [
                  CommonAssetImage(
                    image: image,
                    height: 20,
                    width: 20,
                    color: AppColors.textIconBlue,
                  ),

                  const SizedBox(width: 8),

                  Expanded(
                    child: Column(
                      mainAxisAlignment: .center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title, style: CustomTextstyle.normal500Text12),

                        Text(
                          subTitle,
                          style: style ?? CustomTextstyle.bold600Text15Grey,
                        ),

                        if (extraTitle != null && extraTitle!.isNotEmpty)
                          Text(
                            extraTitle!,
                            style: CustomTextstyle.normal400Text12,
                            overflow: .ellipsis,
                            maxLines: 1,
                          ),
                      ],
                    ),
                  ),
                ],
              ),
              Text(
                "Please select a destination city or airport",
                style: CustomTextstyle.normal400Text12Red,
                overflow: .ellipsis,
                maxLines: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FlightWaySelectionWidget extends GetView<FlightsController> {
  FlightWaySelectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const .symmetric(horizontal: 6, vertical: 5),
        height: 40,
        width: .infinity,
        decoration: BoxDecoration(
          borderRadius: .circular(47),
          color: AppColors.greyF3F4F6,
        ),
        child: Obx(
          () => Row(
            mainAxisAlignment: .spaceEvenly,
            children: [
              CommonFlightWayWidgets(
                title: FlightConstants.oneWay,
                isOneway: controller.isOneWay.value,
                onTap: () => controller.isOneWay.value = true,
              ),
              const SizedBox(width: 15),
              CommonFlightWayWidgets(
                title: FlightConstants.roundTrip,
                isOneway: !controller.isOneWay.value,
                onTap: () => controller.isOneWay.value = false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CommonFlightWayWidgets extends StatelessWidget {
  CommonFlightWayWidgets({
    super.key,
    required this.title,
    this.isOneway = false,
    this.onTap,
  });

  final String title;
  final bool isOneway;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Container(
          height: 30,
          width: .infinity,
          decoration: BoxDecoration(
            borderRadius: .circular(47),
            color: isOneway ? AppColors.white : Colors.transparent,
          ),
          child: Center(
            child: Text(
              title,
              style: isOneway
                  ? CustomTextstyle.mediumText12.copyWith(color: AppColors.red)
                  : CustomTextstyle.mediumText12,
            ),
          ),
        ),
      ),
    );
  }
}

class FlightSpecialFaresFiltersWidget extends GetView<FlightsController> {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0),
      child: SizedBox(
        child: Column(
          crossAxisAlignment: .start,
          mainAxisAlignment: .spaceEvenly,
          children: [
            const SizedBox(height: 12),

            const Text(FlightConstants.specialFares),
            const SizedBox(height: 6),

            SizedBox(
              height: 29,
              child: Obx(() {
                final selectedIndex = controller.isFairIndex.value;

                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.specialFairList.length,
                  itemBuilder: (context, index) {
                    return SpecialFaresChip(
                      fair: controller.specialFairList[index],
                      isFairSelected: selectedIndex == index,
                      onTap: () => controller.toggleFairSelected(index),
                    );
                  },
                );
              }),
            ),
            const SizedBox(height: 9),

            Row(
              children: [
                Obx(
                  () => CommonToggleWidget(
                    isSelected: controller.istoggleDirectFlight.value,
                    onTap: controller.toggleDirectFlight,
                  ),
                ),
                const SizedBox(width: 5),

                Text(
                  FlightConstants.directFlightOnly,
                  style: CustomTextstyle.poppins500Text12,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FlightSearchButton extends GetView<FlightsController> {
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
              FlightConstants.searchFlights,
              style: CustomTextstyle.bold600Text14,
            ),
          ),
        ),
      ),
    );
  }
}

class SpecialFaresChip extends StatelessWidget {
  const new({
    super.key,
    required this.fair,
    required this.onTap,
    required this.isFairSelected,
  });
  final String fair;
  final bool isFairSelected;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 8),
        child: Container(
          clipBehavior: .none,
          alignment: .center,
          padding: const .symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            border: Border.all(
              color: isFairSelected ? AppColors.red : AppColors.textGreyColor,
              width: 1,
            ),
            borderRadius: .circular(26843500),
          ),
          height: 28,
          child: Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text(
                fair,
                style: isFairSelected
                    ? CustomTextstyle.poppins600Text12
                    : CustomTextstyle.poppins500Text12,
              ),
              const SizedBox(width: 4),
              isFairSelected
                  ? const SizedBox.shrink()
                  : const CommonAssetImage(
                      image: Assets.iButton,
                      height: 14,
                      width: 14,
                      color: AppColors.textIconBlue,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class CommonToggleWidget extends GetView<FlightsController> {
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
