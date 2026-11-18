import 'package:get/get.dart';
import 'package:smt_application/src/modules/home/bindings/home_binding.dart';

import '../controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
    HomeBinding().dependencies();
  }
}
