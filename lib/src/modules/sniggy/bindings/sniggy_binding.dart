import 'package:get/get.dart';

import '../controllers/sniggy_controller.dart';

class SniggyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SniggyController>(
      () => SniggyController(),
    );
  }
}
