import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smt_application/generated/assets.dart';

import 'package:smt_application/src/modules/flights/controllers/flight_calendar_controller.dart';
import 'package:smt_application/src/modules/flights/views/calendar/widgets/flight_calendar_bottom_widget.dart';
import 'package:smt_application/src/modules/flights/views/calendar/widgets/flight_calendar_month_widget.dart';
import 'package:smt_application/utils/app_colors.dart';
import 'package:smt_application/utils/app_sizes.dart';
import 'package:smt_application/utils/common_asset_image.dart';
import 'package:smt_application/utils/custom_textstyle.dart';

class FlightCalendarView extends GetView<FlightCalendarController> {
  const FlightCalendarView({super.key});

  @override
  Widget build(BuildContext context) {
    final startDate = controller.calendarStartDate;

    final months = List.generate(controller.totalCalendarMonths, (index) {
      return DateTime(startDate.year, startDate.month + index, 1);
    });

    const weekdays = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

    return Scaffold(
      backgroundColor: AppColors.white,

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSize.s20),
            child: Container(
              color: AppColors.white,
              child: SafeArea(
                bottom: false,
                child: SizedBox(
                  height: kToolbarHeight,
                  child: Row(
                    children: [
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () => Get.back(),
                        child: const SizedBox(
                          width: AppSize.s32,
                          height: kToolbarHeight,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: CommonAssetImage(
                              image: Assets.arrowLeft,
                              height: AppSize.s15,
                              width: AppSize.s15,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: AppSize.s8),
                      Expanded(
                        child: Obx(
                          () => Text(
                            controller.isSelectingReturn.value
                                ? 'Select Return Date'
                                : 'Select Departure Date',
                            style: CustomTextstyle.boldText16,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: AppSize.s56,
            padding: const EdgeInsets.symmetric(horizontal: AppSize.s16),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: AppColors.grey200, width: AppSize.s1),
              ),
            ),
            child: Row(
              children: weekdays.map((day) {
                return Expanded(
                  child: Center(
                    child: Text(
                      day,
                      style: CustomTextstyle.normal400Text12.copyWith(
                        color: AppColors.textIconBlue,
                        fontSize: AppSize.s13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),

          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: months.length,
              itemBuilder: (context, index) {
                return FlightCalendarMonthWidget(
                  month: months[index],
                  controller: controller,
                );
              },
            ),
          ),

          FlightCalendarBottomWidget(controller: controller),
        ],
      ),
    );
  }
}
