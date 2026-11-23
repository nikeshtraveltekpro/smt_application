import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smt_application/src/modules/hotels/controllers/calendar_controller.dart';


class CalendarDateCell extends StatelessWidget {
  final DateTime date;
  final CalendarController controller;

  const CalendarDateCell({
    super.key,
    required this.date,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {

      final isCheckIn = controller.isCheckInDate(date);


      final isCheckOut = controller.isCheckOutDate(date);


      final isInRange = controller.isDateInRange(date);


      final isPast = controller.isPastDate(date);

      final isSelected = isCheckIn || isCheckOut;

      return InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: isPast
            ? null
            : () {
                controller.selectDate(date);
              },
        child: Container(
          margin: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: isSelected
                ? const Color(0xFFE94343)
                : isInRange
                ? const Color(0xFFFCE6E6)
                : Colors.transparent,
            shape: isSelected ? BoxShape.circle : BoxShape.rectangle,
            borderRadius: isSelected ? null : BorderRadius.circular(8),
          ),
          alignment: Alignment.center,
          child: Text(
            '${date.day}',
            style: TextStyle(
              fontSize: 12,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              color: isSelected
                  ? Colors.white
                  : isPast
                  ? Colors.grey.shade400
                  : const Color(0xFF174B79),
            ),
          ),
        ),
      );
    });
  }
}
