import 'package:get/get.dart';
import 'package:smt_application/src/modules/flights/bindings/flights_binding.dart';
import 'package:smt_application/src/modules/hotels/bindings/hotels_binding.dart';

import '../controllers/trip_controller.dart';

class TripBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TripController>(() => TripController());
    FlightsBinding().dependencies();
    HotelBinding().dependencies();
  }
}
