import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:smt_application/src/modules/flights/controllers/flight_calendar_controller.dart';
import 'package:smt_application/src/modules/flights/views/calendar/widgets/flight_calendar_date_cell.dart';
import 'package:smt_application/utils/app_colors.dart';
import 'package:smt_application/utils/app_sizes.dart';
import 'package:smt_application/utils/custom_textstyle.dart';

class FlightCalendarMonthWidget extends StatelessWidget {
  final DateTime month;
  final FlightCalendarController controller;

  const FlightCalendarMonthWidget({
    super.key,
    required this.month,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final firstDay = DateTime(month.year, month.month, 1);

    final lastDay = DateTime(month.year, month.month + 1, 0);

    final totalDays = lastDay.day;

    final startingWeekday = firstDay.weekday % 7;

    final occupiedCells = startingWeekday + totalDays;
    final totalCells = ((occupiedCells / 7).ceil() * 7);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.s16),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: AppSize.s17),
            child: Text(
              DateFormat('MMMM yyyy').format(month),
              textAlign: TextAlign.center,
              style: CustomTextstyle.boldText16.copyWith(fontSize: AppSize.s20),
            ),
          ),

          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: totalCells,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              mainAxisSpacing: AppSize.s2,
              crossAxisSpacing: AppSize.s0,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) {
              DateTime date;
              if (index < startingWeekday) {
                date = firstDay.subtract(
                  Duration(days: startingWeekday - index),
                );
              } else if (index >= startingWeekday + totalDays) {
                date = lastDay.add(
                  Duration(days: index - startingWeekday - totalDays + 1),
                );
              } else {
                date = DateTime(
                  month.year,
                  month.month,
                  index - startingWeekday + 1,
                );
              }

              final isOutsideMonth =
                  date.month != month.month || date.year != month.year;

              return FlightCalendarDateCell(
                date: date,
                controller: controller,
                isOutsideMonth: isOutsideMonth,
              );
            },
          ),

          const SizedBox(height: AppSize.s12),

          const Divider(color: AppColors.grey200, height: 1),
        ],
      ),
    );
  }
}
