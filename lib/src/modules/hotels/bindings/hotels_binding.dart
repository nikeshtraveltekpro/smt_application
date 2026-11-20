import 'package:get/get.dart';
import 'package:smt_application/src/modules/hotels/controllers/calendar_controller.dart';
import 'package:smt_application/src/modules/hotels/controllers/hotel_controller.dart';
import 'package:smt_application/src/modules/hotels/repo/hotel_repositories.dart';

class HotelBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HotelRepositories>(() => HotelRepositories());

    Get.lazyPut<HotelController>(
      () => HotelController(hotelRepositories: Get.find<HotelRepositories>()),
    );

    Get.lazyPut<CalendarController>(() => CalendarController());
  }
}
