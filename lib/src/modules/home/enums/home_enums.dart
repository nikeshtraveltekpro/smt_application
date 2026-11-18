import 'package:smt_application/utils/app_constants.dart';

enum offerFilters { allOffers, flights, trains, hotels, buses }

extension OfferFiltersX on offerFilters {
  String get title {
    switch (this) {
      case offerFilters.allOffers:
        return AppConstants.all_offer;
      case offerFilters.flights:
        return AppConstants.flight;
      case offerFilters.trains:
        return AppConstants.train;
      case offerFilters.hotels:
        return AppConstants.hotels;
      case offerFilters.buses:
        return AppConstants.buses;
    }
  }
}
