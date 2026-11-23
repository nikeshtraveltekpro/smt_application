import 'package:get/get.dart';

class FlightCalendarController extends GetxController {
  final DateTime calendarStartDate = DateTime.now();
  final int totalCalendarMonths = 12;

  final Rx<DateTime> today = DateTime.now().obs;

  final RxBool isSelectingDate = false.obs;
  final Rx<DateTime> depatureDate = DateTime.now().obs;

  DateTime dateOnly(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }
}
