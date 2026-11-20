import 'package:get/get.dart';
import 'package:smt_application/src/modules/flights/controllers/search_airport_controller.dart';
import 'package:smt_application/src/modules/hotels/controllers/calendar_controller.dart';

import '../controllers/flights_controller.dart';

class FlightsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FlightsController>(() => FlightsController());
    Get.lazyPut<CalendarController>(() => CalendarController());
    Get.lazyPut<SearchAirportController>(() => SearchAirportController());
  }
}
