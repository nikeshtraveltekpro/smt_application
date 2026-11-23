import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smt_application/src/modules/flights/controllers/flights_controller.dart';
import 'package:smt_application/src/modules/flights/models/flight_destination_model.dart';
import 'package:smt_application/src/modules/flights/models/flight_recent_search_model.dart';

class SearchAirportController extends GetxController {
  final flightController = Get.find<FlightsController>();
  final TextEditingController searchController = TextEditingController();
  final RxList<FlightDestinationModel> filteredDestinations =
      <FlightDestinationModel>[].obs;
  final RxBool isSelectingFrom = true.obs;
  RxList<FlightRecentSearchModel> get recentFlightSearch =>
      flightController.recentSearch;

  final List<FlightDestinationModel> flightDestinations = [
    FlightDestinationModel(
      city: 'Ahmedabad',
      airport: 'Sardar Vallabhbhai Patel International Airport (AMD)',
    ),
    FlightDestinationModel(
      city: 'Mumbai',
      airport: 'Chhatrapati Shivaji Maharaj International Airport (BOM)',
    ),
    FlightDestinationModel(
      city: 'New Delhi',
      airport: 'Indira Gandhi International Airport (DEL)',
    ),
    FlightDestinationModel(
      city: 'Bengaluru',
      airport: 'Kempegowda International Airport (BLR)',
    ),
    FlightDestinationModel(
      city: 'Goa',
      airport: 'Manohar International Airport (GOX)',
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    filteredDestinations.assignAll(flightDestinations);
    final arguments = Get.arguments;
    if (arguments is bool) {
      isSelectingFrom.value = arguments;
    }
    searchController.addListener(() {
      final query = searchController.text.trim().toLowerCase();
      filteredDestinations.assignAll(
        flightDestinations.where(
          (destination) =>
              destination.city.toLowerCase().contains(query) ||
              destination.airport.toLowerCase().contains(query),
        ),
      );
    });
  }

  bool selectFlightDestination(FlightDestinationModel destination) {
    if (isSelectingFrom.value) {
      if (flightController.selectedToCity.value == destination.city) {
        return false;
      }
      flightController.selectedFromCity.value = destination.city;
      flightController.selectedFromAirport.value = destination.airport;
      return true;
    } else {
      if (flightController.selectedFromCity.value == destination.city) {
        return false;
      }
      flightController.selectedToCity.value = destination.city;
      flightController.selectedToAirport.value = destination.airport;

      return true;
    }
  }

  void selectRecentFlightDestination(List<FlightDestinationModel> destination) {
    flightController.selectedFromCity.value = destination[0].city;
    flightController.selectedFromAirport.value = destination[0].airport;
    flightController.selectedToCity.value = destination[1].city;
    flightController.selectedToAirport.value = destination[1].airport;

    Get.back();
  }

  void selectDestination(FlightRecentSearchModel searchDetail) {
    recentFlightSearch.removeWhere((element) {
      return element.fromCity == searchDetail.fromCity &&
          element.toCity == searchDetail.toCity &&
          element.departureDate == searchDetail.departureDate &&
          element.travellers == searchDetail.travellers &&
          element.travelClass == searchDetail.travelClass;
    });

    recentFlightSearch.insert(0, searchDetail);

    flightController.selectedFromCity.value = searchDetail.fromCity.city;
    flightController.selectedFromAirport.value = searchDetail.fromCity.airport;

    flightController.selectedToCity.value = searchDetail.toCity.city;
    flightController.selectedToAirport.value = searchDetail.toCity.airport;

    Get.back();
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
