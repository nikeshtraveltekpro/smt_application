import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:smt_application/src/modules/flights/models/flight_destination_model.dart';
import 'package:smt_application/src/modules/flights/models/flight_popular_routes_model.dart';
import 'package:smt_application/src/modules/flights/models/flight_recent_search_model.dart';
import 'package:smt_application/src/modules/flights/widgets/flight_constants.dart';
import 'package:smt_application/src/modules/hotels/widgets/snackbar.dart';

class FlightsController extends GetxController {
  RxInt selectedTripTypeIndex = 0.obs;
  RxBool isOneWay = true.obs;
  RxString selectedFromCity = FlightConstants.searchFromCityName.obs;
  RxString selectedFromCode = "DEL".obs;
  RxString selectedFromAirport = FlightConstants.searchFromAirportName.obs;

  RxString selectedToCity = FlightConstants.searchToCityName.obs;
  RxString selectedToCode = "AMD".obs;
  RxString selectedToAirport = FlightConstants.searchToAirportName.obs;
  RxList<FlightRecentSearchModel> recentSearch =
      <FlightRecentSearchModel>[].obs;
  Rx<DateTime> departureDate = DateTime(2026, 9, 29).obs;
  Rxn<DateTime> arrivalDate = Rxn<DateTime>();
  RxInt adultsCount = 2.obs;
  RxInt childrenCount = 0.obs;
  RxInt infantsCount = 0.obs;
  RxString selectedCabinClass = FlightConstants.economy.obs;

  int get totalTravellers =>
      adultsCount.value + childrenCount.value + infantsCount.value;
  RxInt isFairIndex = 0.obs;
  RxBool isMoreThan9Travellers = false.obs;
  RxBool istoggleDirectFlight = false.obs;
  String get shortDate => DateFormat("dd MMM").format(dateOnly(today));

  RxList<FlightPopularRoutesModel> popularRoutes = <FlightPopularRoutesModel>[
    FlightPopularRoutesModel(
      fromCity: 'Dubai',
      toCity: 'Ahmedabad',
      fromCityCode: 'DXB',
      toCityCode: 'AMD',
    ),
    FlightPopularRoutesModel(
      fromCity: 'Ahmedabad',
      toCity: 'Mumbai',
      fromCityCode: 'AMD',
      toCityCode: 'BOM',
    ),
    FlightPopularRoutesModel(
      fromCity: 'Ahmedabad',
      toCity: 'Delhi',
      fromCityCode: 'AMD',
      toCityCode: 'DEL',
    ),
    FlightPopularRoutesModel(
      fromCity: 'Ahmedabad',
      toCity: 'London',
      fromCityCode: 'AMD',
      toCityCode: 'LHR',
    ),
    FlightPopularRoutesModel(
      fromCity: 'Ahmedabad',
      toCity: 'Singapore',
      fromCityCode: 'AMD',
      toCityCode: 'SIN',
    ),
    FlightPopularRoutesModel(
      fromCity: 'Mumbai',
      toCity: 'Dubai',
      fromCityCode: 'BOM',
      toCityCode: 'DXB',
    ),
    FlightPopularRoutesModel(
      fromCity: 'Bengaluru',
      toCity: 'Ahmedabad',
      fromCityCode: 'BLR',
      toCityCode: 'AMD',
    ),
  ].obs;

  DateTime today = DateTime.now();
  void toggleDirectFlight() {
    istoggleDirectFlight.value = !istoggleDirectFlight.value;
  }

  void setTripWay(bool oneWay) {
    isOneWay.value = oneWay;
  }

  void addRecentSearch() {
    recentSearch.removeWhere((element) {
      return element.fromCity.city == selectedFromCity.value &&
          element.toCity.city == selectedToCity.value &&
          element.departureDate == shortDate &&
          element.travellers == totalTravellers &&
          element.travelClass == selectedCabinClass.value;
    });
    recentSearch.insert(
      0,
      FlightRecentSearchModel(
        fromCity: FlightDestinationModel(
          city: selectedFromCity.value,
          airport: selectedFromAirport.value,
        ),
        toCity: FlightDestinationModel(
          city: selectedToCity.value,
          airport: selectedToAirport.value,
        ),
        departureDate: shortDate,
        travellers: totalTravellers,
        travelClass: selectedCabinClass.value,
      ),
    );
    if (recentSearch.length > 5) {
      recentSearch.removeLast();
    }
  }

  final benefits = [
    'Free Cancellation',
    'Free Date Change',
    'Seat Selection',
    'Student Offers',
  ];
  DateTime dateOnly(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  void toggleFairSelected(int index) {
    isFairIndex.value = index;
  }

  final List<String> cabinClasses = [
    FlightConstants.economy,
    FlightConstants.premiumEconomy,
    FlightConstants.business,
    FlightConstants.firstClass,
  ];
  final List<String> specialFairList = [
    FlightConstants.regular,
    FlightConstants.student,
    FlightConstants.seniorCitizen,
    FlightConstants.armedForces,
  ];
  void increaseAdults() {
    if (isMoreThan9Travellers.value || totalTravellers < 9) {
      adultsCount.value++;
    }
  }

  void decreaseAdults() {
    if (adultsCount.value > 1) {
      adultsCount.value--;
      if (infantsCount.value > adultsCount.value) {
        infantsCount.value = adultsCount.value;
      }
    }
  }

  void increaseChildren() {
    if (isMoreThan9Travellers.value || totalTravellers < 9) {
      childrenCount.value++;
    }
  }

  void decreaseChildren() {
    if (childrenCount.value > 0) {
      childrenCount.value--;
    }
  }

  void increaseInfants() {
    if ((isMoreThan9Travellers.value || totalTravellers < 9) &&
        infantsCount.value < adultsCount.value) {
      infantsCount.value++;
    }
  }

  void decreaseInfants() {
    if (infantsCount.value > 0) {
      infantsCount.value--;
    }
  }

  void onSwapTap() {
    final tempCity = selectedFromCity.value;
    final tempCode = selectedFromCode.value;
    final tempAirport = selectedFromAirport.value;

    selectedFromCity.value = selectedToCity.value;
    selectedFromCode.value = selectedToCode.value;
    selectedFromAirport.value = selectedToAirport.value;

    selectedToCity.value = tempCity;
    selectedToCode.value = tempCode;
    selectedToAirport.value = tempAirport;
    if (selectedFromCity.value != FlightConstants.searchSelectCity) {
      AppSnackbar.showSwapInfo(
        "Location Swapped",
        "From ${selectedToCity.value} to ${selectedFromCity.value}",
      );
    }
  }
}
