import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smt_application/src/modules/hotels/controllers/calendar_controller.dart';
import 'package:smt_application/src/modules/hotels/views/calendar/widgets/calendar_date_cell.dart';

class CalendarMonthWidget extends StatelessWidget {
  final DateTime month;
  final CalendarController controller;

  const CalendarMonthWidget({
    super.key,
    required this.month,
    required this.controller,
  });

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

    final firstDay = DateTime(month.year, month.month, 1);


    final lastDay = DateTime(month.year, month.month + 1, 0);


    final totalDays = lastDay.day;




    final startingWeekday = firstDay.weekday % 7;


    final totalCells = startingWeekday + totalDays;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        children: [
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

          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: totalCells,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) {
              if (index < startingWeekday) {
                return const SizedBox();
              }


              final dayNumber = index - startingWeekday + 1;


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
