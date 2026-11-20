import 'package:smt_application/utils/app_constants.dart';

enum OfferFilters { allOffers, flights, trains, hotels, buses }

extension OfferFiltersX on OfferFilters {
  String get title {
    switch (this) {
      case OfferFilters.allOffers:
        return AppConstants.allOffer;
      case OfferFilters.flights:
        return AppConstants.flight;
      case OfferFilters.trains:
        return AppConstants.train;
      case OfferFilters.hotels:
        return AppConstants.hotels;
      case OfferFilters.buses:
        return AppConstants.buses;
    }
  }
}
