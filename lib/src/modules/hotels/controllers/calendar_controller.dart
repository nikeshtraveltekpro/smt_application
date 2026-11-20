import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:smt_application/routes/app_pages.dart';
import 'package:smt_application/src/modules/hotels/models/select_dates_model.dart';

class CalendarController extends GetxController {
  final DateTime calendarStartDate = DateTime.now();
  final int totalCalendarMonths = 12;

  // Selected check-in and check-out dates
  final Rx<SelectDatesModel> selectedDates = const SelectDatesModel().obs;

  // Current date
  final Rx<DateTime> today = DateTime.now().obs;

  // Tells us whether the next selected date is check-out
  final RxBool isSelectingCheckOut = false.obs;

  // Removes the time part from a date
  DateTime dateOnly(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  // Check-in date formatted for the UI
  String get dateIn {
    final checkIn = selectedDates.value.checkInDate;
    return DateFormat('dd MMM, yyyy').format(checkIn ?? today.value);
  }

  // Check-out date formatted for the UI
  String get dateOut {
    final checkOut = selectedDates.value.checkOutDate;
    return DateFormat('dd MMM, yyyy')
        .format(checkOut ?? today.value.add(const Duration(days: 1)));
  }

  // Check-in weekday
  String get checkInDay {
    final checkIn = selectedDates.value.checkInDate;
    return DateFormat('EEEE').format(checkIn ?? today.value);
  }

  // Check-out weekday
  String get checkOutDay {
    final checkOut = selectedDates.value.checkOutDate;
    return DateFormat('EEEE')
        .format(checkOut ?? today.value.add(const Duration(days: 1)));
  }

  // Open calendar and receive selected dates
  Future<void> openCalendar({required bool isCheckIn}) async {
    prepareCalendar(initialDates: selectedDates.value, isCheckIn: isCheckIn);

    final result = await Get.toNamed(Routes.calendar);

    if (result is SelectDatesModel) {
      selectedDates.value = result;
    }
  }

  // Prepare calendar depending on which date the user wants to select
  void prepareCalendar({
    SelectDatesModel? initialDates,
    required bool isCheckIn,
  }) {
    if (isCheckIn) {
      selectedDates.value = const SelectDatesModel();
      isSelectingCheckOut.value = false;
    } else {
      final checkIn = initialDates?.checkInDate;

      selectedDates.value = SelectDatesModel(
        checkInDate: checkIn,
        checkOutDate: null,
        nights: 0,
      );

      isSelectingCheckOut.value = checkIn != null;
    }
  }

  // Select a date from the calendar
  void selectDate(DateTime date) {
    final selectedDate = dateOnly(date);
    final checkIn = selectedDates.value.checkInDate;

    if (!isSelectingCheckOut.value) {
      selectedDates.value = SelectDatesModel(
        checkInDate: selectedDate,
        checkOutDate: null,
        nights: 0,
      );

      isSelectingCheckOut.value = true;
      return;
    }

    if (checkIn == null) {
      isSelectingCheckOut.value = false;
      return;
    }

    if (!selectedDate.isAfter(checkIn)) {
      Get.snackbar(
        'Invalid date',
        'Check-out must be after check-in',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    final nights = selectedDate.difference(checkIn).inDays;

    selectedDates.value = SelectDatesModel(
      checkInDate: checkIn,
      checkOutDate: selectedDate,
      nights: nights,
    );

    isSelectingCheckOut.value = false;
  }

  bool isCheckInDate(DateTime date) {
    final checkIn = selectedDates.value.checkInDate;

    if (checkIn == null) return false;

    return dateOnly(date).isAtSameMomentAs(dateOnly(checkIn));
  }

  bool isCheckOutDate(DateTime date) {
    final checkOut = selectedDates.value.checkOutDate;

    if (checkOut == null) return false;

    return dateOnly(date).isAtSameMomentAs(dateOnly(checkOut));
  }

  bool isDateInRange(DateTime date) {
    final checkIn = selectedDates.value.checkInDate;
    final checkOut = selectedDates.value.checkOutDate;

    if (checkIn == null || checkOut == null) return false;

    final currentDate = dateOnly(date);

    return currentDate.isAfter(checkIn) && currentDate.isBefore(checkOut);
  }

  bool isPastDate(DateTime date) {
    return dateOnly(date).isBefore(dateOnly(DateTime.now()));
  }

  void clearSelectedDates() {
    selectedDates.value = const SelectDatesModel();
    isSelectingCheckOut.value = false;
  }

  void continueWithDates() {
    final dates = selectedDates.value;

    if (dates.checkInDate == null || dates.checkOutDate == null) {
      Get.snackbar(
        'Select dates',
        'Please select check-in and check-out dates',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    Get.back(result: dates);
  }
}
