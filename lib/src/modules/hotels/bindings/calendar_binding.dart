import 'package:get/get.dart';
import 'package:smt_application/src/modules/hotels/controllers/calendar_controller.dart';

class CalendarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CalendarController>(
      () => CalendarController(),
    );
  }
}
