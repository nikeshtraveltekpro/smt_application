import 'package:get/get.dart';
import 'package:smt_application/src/modules/hotels/models/select_dates_model.dart';

class CalendarController extends GetxController {
  // --------------------------------------------------
  // 1. CALENDAR CONFIGURATION
  // --------------------------------------------------

  // First month displayed in the calendar.
  final DateTime calendarStartDate = DateTime.now();

  // Number of months displayed.
  final int totalCalendarMonths = 12;

  // --------------------------------------------------
  // 2. SELECTED DATES
  // --------------------------------------------------

  // Stores check-in date, check-out date and total nights.
  final Rx<SelectDatesModel> selectedDates = const SelectDatesModel().obs;

  // false = selecting check-in
  // true = selecting check-out
  final RxBool isSelectingCheckOut = false.obs;

  // --------------------------------------------------
  // 3. REMOVE TIME FROM DATE
  // --------------------------------------------------

  DateTime dateOnly(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  // --------------------------------------------------
  // 4. PREPARE CALENDAR
  // --------------------------------------------------

  void prepareCalendar({
    SelectDatesModel? initialDates,
    required bool isCheckIn,
  }) {
    if (isCheckIn) {
      // Start a fresh date selection.
      selectedDates.value = const SelectDatesModel();

      isSelectingCheckOut.value = false;
    } else {
      // Keep existing check-in date.
      final checkIn = initialDates?.checkInDate;

      selectedDates.value = SelectDatesModel(
        checkInDate: checkIn,
        checkOutDate: null,
        nights: 0,
      );

      // If check-in exists, select checkout next.
      isSelectingCheckOut.value = checkIn != null;
    }
  }

  // --------------------------------------------------
  // 5. SELECT DATE
  // --------------------------------------------------

  void selectDate(DateTime date) {
    final selectedDate = dateOnly(date);

    final checkIn = selectedDates.value.checkInDate;

    // STEP 1: Select check-in date.
    if (!isSelectingCheckOut.value) {
      selectedDates.value = SelectDatesModel(
        checkInDate: selectedDate,
        checkOutDate: null,
        nights: 0,
      );

      // Next selection will be checkout.
      isSelectingCheckOut.value = true;

      return;
    }

    // STEP 2: Check-in must exist.
    if (checkIn == null) {
      isSelectingCheckOut.value = false;
      return;
    }

    // STEP 3: Checkout must be after check-in.
    if (!selectedDate.isAfter(checkIn)) {
      Get.snackbar(
        'Invalid date',
        'Check-out must be after check-in',
        snackPosition: SnackPosition.BOTTOM,
      );

      return;
    }

    // STEP 4: Calculate total nights.
    final nights = selectedDate.difference(checkIn).inDays;

    // STEP 5: Save selected dates.
    selectedDates.value = SelectDatesModel(
      checkInDate: checkIn,
      checkOutDate: selectedDate,
      nights: nights,
    );

    // Selection is complete.
    isSelectingCheckOut.value = false;
  }

  // --------------------------------------------------
  // 6. CHECK-IN DATE
  // --------------------------------------------------

  bool isCheckInDate(DateTime date) {
    final checkIn = selectedDates.value.checkInDate;

    if (checkIn == null) {
      return false;
    }

    return dateOnly(date).isAtSameMomentAs(dateOnly(checkIn));
  }

  // --------------------------------------------------
  // 7. CHECK-OUT DATE
  // --------------------------------------------------

  bool isCheckOutDate(DateTime date) {
    final checkOut = selectedDates.value.checkOutDate;

    if (checkOut == null) {
      return false;
    }

    return dateOnly(date).isAtSameMomentAs(dateOnly(checkOut));
  }

  // --------------------------------------------------
  // 8. CHECK DATE BETWEEN CHECK-IN AND CHECK-OUT
  // --------------------------------------------------

  bool isDateInRange(DateTime date) {
    final checkIn = selectedDates.value.checkInDate;
    final checkOut = selectedDates.value.checkOutDate;

    if (checkIn == null || checkOut == null) {
      return false;
    }

    final currentDate = dateOnly(date);

    return currentDate.isAfter(checkIn) && currentDate.isBefore(checkOut);
  }

  // --------------------------------------------------
  // 9. CHECK PAST DATE
  // --------------------------------------------------

  bool isPastDate(DateTime date) {
    final today = dateOnly(DateTime.now());

    return dateOnly(date).isBefore(today);
  }

  // --------------------------------------------------
  // 10. CLEAR SELECTED DATES
  // --------------------------------------------------

  void clearSelectedDates() {
    selectedDates.value = const SelectDatesModel();

    isSelectingCheckOut.value = false;
  }

  // --------------------------------------------------
  // 11. CONTINUE BUTTON
  // --------------------------------------------------

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
