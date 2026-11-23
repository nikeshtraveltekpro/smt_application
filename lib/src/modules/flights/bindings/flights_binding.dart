import 'package:get/get.dart';
import 'package:smt_application/src/modules/flights/controllers/search_airport_controller.dart';
import 'package:smt_application/src/modules/flights/controllers/flight_calendar_controller.dart';
import 'package:smt_application/src/modules/hotels/controllers/calendar_controller.dart';

import '../controllers/flights_controller.dart';

class FlightsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FlightsController>(() => FlightsController(), fenix: true);

    Get.lazyPut<CalendarController>(() => CalendarController(), fenix: true);

    Get.lazyPut<FlightCalendarController>(
      () => FlightCalendarController(),
      fenix: true,
    );

    Get.lazyPut<SearchAirportController>(
      () => SearchAirportController(),
      fenix: true,
    );
  }
}
