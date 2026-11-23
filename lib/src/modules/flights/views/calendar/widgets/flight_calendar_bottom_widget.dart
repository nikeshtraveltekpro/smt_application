import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:smt_application/src/modules/flights/controllers/flight_calendar_controller.dart';
import 'package:smt_application/src/modules/flights/controllers/flights_controller.dart';
import 'package:smt_application/utils/app_colors.dart';
import 'package:smt_application/utils/app_sizes.dart';
import 'package:smt_application/utils/custom_textstyle.dart';

class FlightCalendarBottomWidget extends StatelessWidget {
  final FlightCalendarController controller;

  FlightCalendarBottomWidget({super.key, required this.controller});

  final FlightsController flightController = Get.find<FlightsController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(
        AppSize.s16,
        AppSize.s12,
        AppSize.s16,
        AppSize.s16,
      ),

      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.blackSolid.withValues(alpha: 0.06),
            blurRadius: AppSize.s10,
            offset: const Offset(0, -AppSize.s3),
          ),
        ],
      ),

      child: Obx(() {
        final departure = controller.selectedDepartureDate.value;
        final returnDate = controller.selectedReturnDate.value;
        final today = controller.normalizeDate(DateTime.now());
        final defaultDeparture = departure ?? today;
        final defaultReturn =
            returnDate ?? defaultDeparture.add(const Duration(days: 1));

        final isOneWay = flightController.isOneWay.value;

        return Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSize.s10,
                vertical: AppSize.s12,
              ),

              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(AppSize.s12),
                border: Border.all(color: AppColors.grey200, width: AppSize.s1),
              ),

              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Departure',
                          style: CustomTextstyle.normal400Text10.copyWith(
                            color: AppColors.textGreyColor,
                          ),
                        ),

                        const SizedBox(height: AppSize.s4),

                        Text(
                          DateFormat('dd MMM, yyyy').format(defaultDeparture),

                          style: CustomTextstyle.bold600Text15,
                        ),
                      ],
                    ),
                  ),

                  if (!isOneWay) ...[
                    Container(
                      height: AppSize.s30,
                      width: AppSize.s1,
                      color: AppColors.grey200,
                    ),

                    const SizedBox(width: AppSize.s10),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Return',
                            style: CustomTextstyle.normal400Text10.copyWith(
                              color: AppColors.textGreyColor,
                            ),
                          ),

                          const SizedBox(height: AppSize.s4),

                          Text(
                            DateFormat('dd MMM, yyyy').format(defaultReturn),

                            style: CustomTextstyle.bold600Text15,
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),

            const SizedBox(height: AppSize.s10),

            SizedBox(
              width: double.infinity,
              height: AppSize.s46,

              child: ElevatedButton(
                onPressed: controller.continueSelection,

                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.red,
                  foregroundColor: AppColors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSize.s10),
                  ),
                ),

                child: Text('Continue', style: CustomTextstyle.bold600Text14),
              ),
            ),
          ],
        );
      }),
    );
  }
}
