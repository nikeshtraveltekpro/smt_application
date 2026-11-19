import 'package:get/get.dart';

class RoomModel {
  RxInt adults;
  RxInt children;

  RoomModel({int adults = 1, int children = 0})
    : adults = adults.obs,
      children = children.obs;
}
