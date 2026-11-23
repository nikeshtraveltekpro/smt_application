

part of 'home_content_model.dart';





_HomeContentModel _$HomeContentModelFromJson(Map<String, dynamic> json) =>
    _HomeContentModel(
      categories: (json['categories'] as List<dynamic>)
          .map((e) => HomeCategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      subcategories: (json['subcategories'] as List<dynamic>)
          .map((e) => HomeSubcategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      offers: (json['offers'] as List<dynamic>)
          .map((e) => HomeOfferModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      hotelDeals: (json['hotelDeals'] as List<dynamic>)
          .map((e) => HomeHotelDealModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      topFlights: (json['topFlights'] as List<dynamic>)
          .map((e) => HomeTopFlightsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      dynamicBanners: (json['dynamicBanners'] as List<dynamic>)
          .map(
            (e) => HomeDynamicBannerModel.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );

Map<String, dynamic> _$HomeContentModelToJson(_HomeContentModel instance) =>
    <String, dynamic>{
      'categories': instance.categories,
      'subcategories': instance.subcategories,
      'offers': instance.offers,
      'hotelDeals': instance.hotelDeals,
      'topFlights': instance.topFlights,
      'dynamicBanners': instance.dynamicBanners,
    };
