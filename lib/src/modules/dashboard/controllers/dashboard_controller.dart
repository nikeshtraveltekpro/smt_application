import 'package:get/get.dart';
import 'package:smt_application/src/modules/dashboard/enums/screens_enums.dart';

class DashboardController extends GetxController {
  final RxInt currentIndex = 0.obs;

  BodyScreens get currentScreen => BodyScreens.values[currentIndex.value];

  void selectedIndex(int index) {
    currentIndex.value = index;
  }
}
