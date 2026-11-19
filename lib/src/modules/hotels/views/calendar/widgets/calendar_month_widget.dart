import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smt_application/src/modules/hotels/controllers/calendar_controller.dart';
import 'package:smt_application/src/modules/hotels/views/calendar/widgets/calendar_date_cell.dart';

import '../../../controllers/hotel_controller.dart';

class CalendarMonthWidget extends StatelessWidget {
  final DateTime month;
  final CalendarController controller;

  const CalendarMonthWidget({
    super.key,
    required this.month,
    required this.controller,
  });

  // Weekday names.
  final List<String> weekdays = const [
    'Sun',
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
  ];

  @override
  Widget build(BuildContext context) {
    // First date of this month.
    final firstDay = DateTime(month.year, month.month, 1);

    // Last date of this month.
    final lastDay = DateTime(month.year, month.month + 1, 0);

    // Number of days in this month.
    final totalDays = lastDay.day;

    // Weekday of the first day.
    // Dart: Monday = 1, Sunday = 7.
    // We convert it to Sunday = 0.
    final startingWeekday = firstDay.weekday % 7;

    // Empty spaces before the first date.
    final totalCells = startingWeekday + totalDays;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        children: [
          // MONTH TITLE
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text(
              DateFormat('MMMM yyyy').format(month),
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(0xFF174B79),
              ),
            ),
          ),

          // WEEKDAY NAMES
          Row(
            children: weekdays.map((day) {
              return Expanded(
                child: Center(
                  child: Text(
                    day,
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF174B79),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),

          const SizedBox(height: 10),

          // CALENDAR DATES
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: totalCells,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) {
              // Empty spaces before the first day.
              if (index < startingWeekday) {
                return const SizedBox();
              }

              // Calculate actual date number.
              final dayNumber = index - startingWeekday + 1;

              // Create DateTime for this calendar cell.
              final date = DateTime(month.year, month.month, dayNumber);

              return CalendarDateCell(date: date, controller: controller);
            },
          ),

          const SizedBox(height: 12),

          const Divider(color: Color(0xFFE6EAF0), height: 1),
        ],
      ),
    );
  }
}
