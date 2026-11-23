import 'package:get/get.dart';
import 'package:smt_application/src/modules/flights/controllers/flights_controller.dart';
import 'package:smt_application/src/modules/flights/views/calendar/flight_calendar_view.dart';

class FlightCalendarController extends GetxController {

  final FlightsController flightController = Get.find<FlightsController>();


  late DateTime calendarStartDate;


  final int totalCalendarMonths = 12;


  final Rxn<DateTime> selectedDepartureDate = Rxn<DateTime>();


  final Rxn<DateTime> selectedReturnDate = Rxn<DateTime>();


  final RxBool isSelectingReturn = false.obs;


  bool get isOneWay => flightController.isOneWay.value;


  final Map<String, int> flightPrices = {
    '2026-11-23': 3890,
    '2026-11-24': 4200,
    '2026-11-25': 3650,
    '2026-11-26': 4500,
    '2026-11-27': 3900,
    '2026-11-28': 4100,
  };
Future<void> openCalendar({required bool isDeparture}) async {
      isSelectingReturn.value = !isDeparture;

      final result = await Get.to(() => const FlightCalendarView());

      if (result == null) return;

      selectedDepartureDate.value = result['departureDate'];
      selectedReturnDate.value = result['returnDate'];
    }
  @override
  void onInit() {
    super.onInit();

    final today = normalizeDate(DateTime.now());
    calendarStartDate = DateTime(today.year, today.month);
    selectedDepartureDate.value = today;
    selectedReturnDate.value = today.add(const Duration(days: 1));
  }


  DateTime normalizeDate(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }


  void selectDate(DateTime date) {
    final selected = normalizeDate(date);


    if (isPastDate(selected)) {
      return;
    }


    if (isOneWay) {
      selectedDepartureDate.value = selected;
      selectedReturnDate.value = null;
      return;
    }


    if (!isSelectingReturn.value) {
      selectedDepartureDate.value = selected;


      selectedReturnDate.value = null;


      isSelectingReturn.value = true;

      return;
    }


    final departure = selectedDepartureDate.value;

    if (departure == null) {
      isSelectingReturn.value = false;
      return;
    }


    if (!selected.isAfter(departure)) {
      Get.snackbar(
        'Invalid Return Date',
        'Return date must be after departure date',
      );
      return;
    }

    selectedReturnDate.value = selected;
  }


  bool isDepartureDate(DateTime date) {
    return selectedDepartureDate.value != null &&
        normalizeDate(selectedDepartureDate.value!) == normalizeDate(date);
  }


  bool isReturnDate(DateTime date) {
    return selectedReturnDate.value != null &&
        normalizeDate(selectedReturnDate.value!) == normalizeDate(date);
  }


  bool isDateInRange(DateTime date) {
    final departure = selectedDepartureDate.value;
    final returnDate = selectedReturnDate.value;

    if (departure == null || returnDate == null) {
      return false;
    }

    final selected = normalizeDate(date);

    return selected.isAfter(departure) && selected.isBefore(returnDate);
  }


  bool isPastDate(DateTime date) {
    final today = normalizeDate(DateTime.now());
    final selected = normalizeDate(date);

    return selected.isBefore(today);
  }


  bool isSelected(DateTime date) {
    return isDepartureDate(date) || isReturnDate(date);
  }










  DateTime getMonth(int index) {
    return DateTime(calendarStartDate.year, calendarStartDate.month + index);
  }


  void continueSelection() {
    final departure = selectedDepartureDate.value;


    if (departure == null) {
      Get.snackbar('Select Departure', 'Please select your departure date');
      return;
    }



    if (!isOneWay && selectedReturnDate.value == null) {
      Get.snackbar('Select Return', 'Please select your return date');
      return;
    }

    Get.back(
      result: {
        'departureDate': selectedDepartureDate.value,
        'returnDate': selectedReturnDate.value,
      },
    );
  }
}
