import 'package:get/get.dart';
import 'package:smt_application/src/modules/hotels/controllers/calendar_controller.dart';
import 'package:smt_application/src/modules/hotels/controllers/hotel_controller.dart';
import 'package:smt_application/src/modules/hotels/controllers/search_city_controller.dart';

class HotelBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HotelController>(() => HotelController());

    Get.lazyPut<SearchCityController>(
      () => SearchCityController(hotelController: Get.find<HotelController>()),
    );
    Get.lazyPut<CalendarController>(() => CalendarController());
  }
}
