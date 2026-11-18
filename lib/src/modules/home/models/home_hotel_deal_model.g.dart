// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_hotel_deal_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HomeHotelDealModel _$HomeHotelDealModelFromJson(Map<String, dynamic> json) =>
    _HomeHotelDealModel(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String? ?? 'No Title',
      image: json['image'] as String?,
      location: json['location'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      review: json['review'] as String?,
      price: json['price'] as String?,
      taxAmount: json['taxAmount'] as String?,
    );

Map<String, dynamic> _$HomeHotelDealModelToJson(_HomeHotelDealModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'location': instance.location,
      'rating': instance.rating,
      'review': instance.review,
      'price': instance.price,
      'taxAmount': instance.taxAmount,
    };
