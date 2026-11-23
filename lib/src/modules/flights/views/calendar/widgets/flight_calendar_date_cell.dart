import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:smt_application/src/modules/flights/controllers/flight_calendar_controller.dart';
import 'package:smt_application/utils/app_colors.dart';
import 'package:smt_application/utils/app_sizes.dart';
import 'package:smt_application/utils/custom_textstyle.dart';

class FlightCalendarDateCell extends StatelessWidget {
  final DateTime date;
  final FlightCalendarController controller;
  final bool isOutsideMonth;

  const FlightCalendarDateCell({
    super.key,
    required this.date,
    required this.controller,
    this.isOutsideMonth = false,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isDeparture = controller.isDepartureDate(date);
      final isReturn = controller.isReturnDate(date);
      final isInRange = controller.isDateInRange(date);
      final isPast = controller.isPastDate(date);
      final isSelected = isDeparture || isReturn;
      final isDisabled = isOutsideMonth || isPast;

      const price = 3900;

      return InkWell(
        borderRadius: BorderRadius.circular(AppSize.s6),
        onTap: isDisabled
            ? null
            : () {
                controller.selectDate(date);
              },
        child: Container(
          margin: const EdgeInsets.all(AppSize.s2),
          width: AppSize.s45,
          height: AppSize.s40,
          decoration: BoxDecoration(
            color: isSelected
                ? AppColors.red
                : isInRange
                ? AppColors.red.withValues(alpha: 0.12)
                : AppColors.transparent,
            borderRadius: BorderRadius.circular(AppSize.s6),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: AppSize.s21,
                child: Center(
                  child: Text(
                    '${date.day}',
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    softWrap: false,
                    overflow: TextOverflow.visible,
                    style: isSelected
                        ? CustomTextstyle.medium500Text14
                        : isDisabled
                        ? CustomTextstyle.medium500Text14Black.copyWith(
                            color: AppColors.greyLight7,
                          )
                        : CustomTextstyle.medium500Text14Black,
                  ),
                ),
              ),

              SizedBox(
                height: AppSize.s17,
                child: Center(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      isDisabled ? '--' : '₹$price',
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      style: CustomTextstyle.regular400Text11.copyWith(
                        color: isSelected
                            ? AppColors.white
                            : isDisabled
                            ? AppColors.greyLight7
                            : AppColors.textGreen,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
