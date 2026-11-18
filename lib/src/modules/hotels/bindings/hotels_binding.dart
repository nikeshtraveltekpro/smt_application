import 'package:get/get.dart';
import 'package:smt_application/src/modules/hotels/controllers/Hotel_controller.dart';

class HotelBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HotelController>(() => HotelController());
  }
}
