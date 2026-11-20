import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smt_application/src/modules/hotels/controllers/hotel_controller.dart';
import 'package:smt_application/src/modules/hotels/models/city_destination_model.dart';

class SearchCityController extends GetxController {
  SearchCityController({required this.hotelController});

  final HotelController hotelController;

  final TextEditingController searchController = TextEditingController();

  final RxString searchQuery = ''.obs;

  final RxList<CityDestinationModel> recentCitySearches =
      <CityDestinationModel>[
        CityDestinationModel(
          title: 'Ahmedabad, Gujarat, India',
          subtitle: 'Ahmedabad',
        ),
      ].obs;

  final List<CityDestinationModel> popularDestinations = [
    CityDestinationModel(
      title: 'Ahmedabad, Gujarat, India',
      subtitle: 'Ahmedabad',
    ),
    CityDestinationModel(
      title: 'Mumbai, Maharashtra, India',
      subtitle: 'Mumbai',
    ),
    CityDestinationModel(
      title: 'New Delhi, Delhi, India',
      subtitle: 'New Delhi',
    ),
    CityDestinationModel(
      title: 'Bengaluru, Karnataka, India',
      subtitle: 'Bengaluru',
    ),
    CityDestinationModel(title: 'Jaipur, Rajasthan, India', subtitle: 'Jaipur'),
    CityDestinationModel(title: 'Goa, India', subtitle: 'Goa'),
    CityDestinationModel(
      title: 'Udaipur, Rajasthan, India',
      subtitle: 'Udaipur',
    ),
  ];

  final RxList<CityDestinationModel> filteredDestinations =
      <CityDestinationModel>[].obs;

  @override
  void onInit() {
    super.onInit();

    filteredDestinations.assignAll(popularDestinations);

    searchController.addListener(() {
      onSearchChanged(searchController.text);
    });
  }

  void onSearchChanged(String value) {
    searchQuery.value = value;

    if (value.trim().isEmpty) {
      filteredDestinations.assignAll(popularDestinations);
      return;
    }

    final query = value.trim().toLowerCase();

    filteredDestinations.assignAll(
      popularDestinations.where(
        (item) =>
            item.title.toLowerCase().contains(query) ||
            item.subtitle.toLowerCase().contains(query),
      ),
    );
  }

  void clearRecentSearches() {
    recentCitySearches.clear();
  }

  void selectNearMe() {
    selectDestination(
      CityDestinationModel(
        title: 'Ahmedabad, Gujarat, India',
        subtitle: 'Ahmedabad',
      ),
    );
  }

  void selectDestination(CityDestinationModel destination) {
    recentCitySearches.removeWhere((item) => item.title == destination.title);

    recentCitySearches.insert(0, destination);

    hotelController.selectedCity.value = destination.subtitle;

    Get.back();
  }

  void clearSearch() {
    searchController.clear();
    searchQuery.value = '';
    filteredDestinations.assignAll(popularDestinations);
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
