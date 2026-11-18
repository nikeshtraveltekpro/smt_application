import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smt_application/src/modules/home/models/home_category_model.dart';
import 'package:smt_application/src/modules/home/models/home_dynamic_banner_model.dart';
import 'package:smt_application/src/modules/home/models/home_hotel_deal_model.dart';
import 'package:smt_application/src/modules/home/models/home_offer_model.dart';
import 'package:smt_application/src/modules/home/models/home_subcategory_model.dart';
import 'package:smt_application/src/modules/home/models/home_top_flights_model.dart';
part 'home_content_model.freezed.dart';
part 'home_content_model.g.dart';

@freezed
abstract class HomeContentModel with _$HomeContentModel {
  const factory HomeContentModel({
    required List<HomeCategoryModel> categories,
    required List<HomeSubcategoryModel> subcategories,
    required List<HomeOfferModel> offers,
    required List<HomeHotelDealModel> hotelDeals,
    required List<HomeTopFlightsModel> topFlights,
    required List<HomeDynamicBannerModel> dynamicBanners,
  }) = _HomeContentModel;

  factory HomeContentModel.fromJson(Map<String, dynamic> json) =>
      _$HomeContentModelFromJson(json);
}
