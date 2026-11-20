import 'package:get/get.dart';
import 'package:smt_application/src/modules/hotels/controllers/hotel_controller.dart';
import 'package:smt_application/src/modules/hotels/controllers/search_city_controller.dart';
import 'package:smt_application/src/modules/hotels/repo/hotel_repositories.dart';

class SearchCityBinding extends Bindings {
  @override
  void dependencies() {
    if (!Get.isRegistered<HotelController>()) {
      Get.lazyPut<HotelRepositories>(() => HotelRepositories());
      Get.lazyPut<HotelController>(
        () => HotelController(hotelRepositories: Get.find<HotelRepositories>()),
      );
    }

    Get.lazyPut<SearchCityController>(
      () => SearchCityController(hotelController: Get.find<HotelController>()),
    );
  }
}
