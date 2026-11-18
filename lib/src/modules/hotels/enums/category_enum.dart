import 'package:smt_application/generated/assets.dart';
import 'package:smt_application/src/modules/hotels/widgets/hotel_constants.dart';

enum CategoryEnum { flights, trains, hotels, buses, cars, holidays }

extension CategoryEnumX on CategoryEnum {
  String get title {
    switch (this) {
      case CategoryEnum.flights:
        return HotelConstants.flights;
      case CategoryEnum.trains:
        return HotelConstants.trains;
      case CategoryEnum.hotels:
        return HotelConstants.hotels;
      case CategoryEnum.buses:
        return HotelConstants.buses;
      case CategoryEnum.cars:
        return HotelConstants.cars;
      case CategoryEnum.holidays:
        return HotelConstants.holidays;
    }
  }

  String get icon {
    switch (this) {
      case CategoryEnum.flights:
        return Assets.plane;
      case CategoryEnum.trains:
        return Assets.train;
      case CategoryEnum.hotels:
        return Assets.hotel;
      case CategoryEnum.buses:
        return Assets.bus;
      case CategoryEnum.cars:
        return Assets.car;
      case CategoryEnum.holidays:
        return Assets.holiday;
    }
  }
}
