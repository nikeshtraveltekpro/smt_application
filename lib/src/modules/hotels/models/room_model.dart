import 'package:get/get.dart';

class RoomModel {
  RxInt adults;
  RxInt children;
  RxList<String>? _childAges;

  RxList<String> get childAges =>
      _childAges ??= List<String>.filled(children.value, 'Under 1').obs;

  RoomModel({int adults = 1, int children = 0})
    : adults = adults.obs,
      children = children.obs;
}
