import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:smt_application/src/modules/hotels/controllers/calendar_controller.dart';
import 'package:smt_application/src/modules/hotels/views/calendar/widgets/calendar_month_widget.dart';

class CalendarView extends GetView<CalendarController> {
  const CalendarView({super.key});

  @override
  Widget build(BuildContext context) {

    final startDate = controller.calendarStartDate;

    final months = List.generate(controller.totalCalendarMonths, (index) {
      return DateTime(startDate.year, startDate.month + index, 1);
    });

    return Scaffold(
      backgroundColor: Colors.white,


      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 18,
            color: Color(0xFF174B79),
          ),
        ),
        title: const Text(
          'Select Dates',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF174B79),
          ),
        ),
      ),


      body: Column(
        children: [

          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: months.length,
              itemBuilder: (context, index) {
                return CalendarMonthWidget(
                  month: months[index],
                  controller: controller,
                );
              },
            ),
          ),


          _buildBottomSection(),
        ],
      ),
    );
  }

  Widget _buildBottomSection() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 10,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: Obx(() {
        final dates = controller.selectedDates.value;

        final checkIn = dates.checkInDate;
        final checkOut = dates.checkOutDate;

        return Column(
          children: [

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFE5E8ED)),
              ),
              child: Row(
                children: [

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Check-in',
                          style: TextStyle(fontSize: 10, color: Colors.grey),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          checkIn != null
                              ? DateFormat('dd MMM, yyyy').format(checkIn)
                              : 'Select date',
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF174B79),
                          ),
                        ),
                      ],
                    ),
                  ),


                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 9,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF252B82),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      '${dates.nights} nights',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),


                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          'Check-out',
                          style: TextStyle(fontSize: 10, color: Colors.grey),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          checkOut != null
                              ? DateFormat('dd MMM, yyyy').format(checkOut)
                              : 'Select date',
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF174B79),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),


            SizedBox(
              width: double.infinity,
              height: 46,
              child: ElevatedButton(
                onPressed: controller.continueWithDates,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE94343),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
