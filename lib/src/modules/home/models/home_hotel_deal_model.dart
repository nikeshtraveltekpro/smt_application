import 'package:freezed_annotation/freezed_annotation.dart';
part "home_hotel_deal_model.freezed.dart";
part "home_hotel_deal_model.g.dart";

@freezed
abstract class HomeHotelDealModel with _$HomeHotelDealModel {
  const factory HomeHotelDealModel({
    int? id,
    @Default('No Title') String? title,
    String? image,
    String? location,
    double? rating,
    String? review,
    String? price,
    String? taxAmount,
  }) = _HomeHotelDealModel;

  factory HomeHotelDealModel.fromJson(Map<String, dynamic> json) =>
      _$HomeHotelDealModelFromJson(json);
}
