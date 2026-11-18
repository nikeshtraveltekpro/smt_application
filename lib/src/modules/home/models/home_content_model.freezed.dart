// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_content_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HomeContentModel {

 List<HomeCategoryModel> get categories; List<HomeSubcategoryModel> get subcategories; List<HomeOfferModel> get offers; List<HomeHotelDealModel> get hotelDeals; List<HomeTopFlightsModel> get topFlights; List<HomeDynamicBannerModel> get dynamicBanners;
/// Create a copy of HomeContentModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeContentModelCopyWith<HomeContentModel> get copyWith => _$HomeContentModelCopyWithImpl<HomeContentModel>(this as HomeContentModel, _$identity);

  /// Serializes this HomeContentModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as HomeContentModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeContentModel&&const DeepCollectionEquality().equals(other.categories, _this.categories)&&const DeepCollectionEquality().equals(other.subcategories, _this.subcategories)&&const DeepCollectionEquality().equals(other.offers, _this.offers)&&const DeepCollectionEquality().equals(other.hotelDeals, _this.hotelDeals)&&const DeepCollectionEquality().equals(other.topFlights, _this.topFlights)&&const DeepCollectionEquality().equals(other.dynamicBanners, _this.dynamicBanners));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as HomeContentModel;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.categories),const DeepCollectionEquality().hash(_this.subcategories),const DeepCollectionEquality().hash(_this.offers),const DeepCollectionEquality().hash(_this.hotelDeals),const DeepCollectionEquality().hash(_this.topFlights),const DeepCollectionEquality().hash(_this.dynamicBanners));
}

@override
String toString() {
  final _this = this as HomeContentModel;
  return 'HomeContentModel(categories: ${_this.categories}, subcategories: ${_this.subcategories}, offers: ${_this.offers}, hotelDeals: ${_this.hotelDeals}, topFlights: ${_this.topFlights}, dynamicBanners: ${_this.dynamicBanners})';
}


}

/// @nodoc
abstract mixin class $HomeContentModelCopyWith<$Res>  {
  factory $HomeContentModelCopyWith(HomeContentModel value, $Res Function(HomeContentModel) _then) = _$HomeContentModelCopyWithImpl;
@useResult
$Res call({
 List<HomeCategoryModel> categories, List<HomeSubcategoryModel> subcategories, List<HomeOfferModel> offers, List<HomeHotelDealModel> hotelDeals, List<HomeTopFlightsModel> topFlights, List<HomeDynamicBannerModel> dynamicBanners
});




}
/// @nodoc
class _$HomeContentModelCopyWithImpl<$Res>
    implements $HomeContentModelCopyWith<$Res> {
  _$HomeContentModelCopyWithImpl(this._self, this._then);

  final HomeContentModel _self;
  final $Res Function(HomeContentModel) _then;

/// Create a copy of HomeContentModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? categories = null,Object? subcategories = null,Object? offers = null,Object? hotelDeals = null,Object? topFlights = null,Object? dynamicBanners = null,}) {
  return _then(HomeContentModel(
categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<HomeCategoryModel>,subcategories: null == subcategories ? _self.subcategories : subcategories // ignore: cast_nullable_to_non_nullable
as List<HomeSubcategoryModel>,offers: null == offers ? _self.offers : offers // ignore: cast_nullable_to_non_nullable
as List<HomeOfferModel>,hotelDeals: null == hotelDeals ? _self.hotelDeals : hotelDeals // ignore: cast_nullable_to_non_nullable
as List<HomeHotelDealModel>,topFlights: null == topFlights ? _self.topFlights : topFlights // ignore: cast_nullable_to_non_nullable
as List<HomeTopFlightsModel>,dynamicBanners: null == dynamicBanners ? _self.dynamicBanners : dynamicBanners // ignore: cast_nullable_to_non_nullable
as List<HomeDynamicBannerModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeContentModel].
extension HomeContentModelPatterns on HomeContentModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeContentModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeContentModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeContentModel value)  $default,){
final _that = this;
switch (_that) {
case _HomeContentModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeContentModel value)?  $default,){
final _that = this;
switch (_that) {
case _HomeContentModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<HomeCategoryModel> categories,  List<HomeSubcategoryModel> subcategories,  List<HomeOfferModel> offers,  List<HomeHotelDealModel> hotelDeals,  List<HomeTopFlightsModel> topFlights,  List<HomeDynamicBannerModel> dynamicBanners)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeContentModel() when $default != null:
return $default(_that.categories,_that.subcategories,_that.offers,_that.hotelDeals,_that.topFlights,_that.dynamicBanners);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<HomeCategoryModel> categories,  List<HomeSubcategoryModel> subcategories,  List<HomeOfferModel> offers,  List<HomeHotelDealModel> hotelDeals,  List<HomeTopFlightsModel> topFlights,  List<HomeDynamicBannerModel> dynamicBanners)  $default,) {final _that = this;
switch (_that) {
case _HomeContentModel():
return $default(_that.categories,_that.subcategories,_that.offers,_that.hotelDeals,_that.topFlights,_that.dynamicBanners);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<HomeCategoryModel> categories,  List<HomeSubcategoryModel> subcategories,  List<HomeOfferModel> offers,  List<HomeHotelDealModel> hotelDeals,  List<HomeTopFlightsModel> topFlights,  List<HomeDynamicBannerModel> dynamicBanners)?  $default,) {final _that = this;
switch (_that) {
case _HomeContentModel() when $default != null:
return $default(_that.categories,_that.subcategories,_that.offers,_that.hotelDeals,_that.topFlights,_that.dynamicBanners);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HomeContentModel implements HomeContentModel {
  const _HomeContentModel({required  List<HomeCategoryModel> categories, required  List<HomeSubcategoryModel> subcategories, required  List<HomeOfferModel> offers, required  List<HomeHotelDealModel> hotelDeals, required  List<HomeTopFlightsModel> topFlights, required  List<HomeDynamicBannerModel> dynamicBanners}): _categories = categories,_subcategories = subcategories,_offers = offers,_hotelDeals = hotelDeals,_topFlights = topFlights,_dynamicBanners = dynamicBanners;
  factory _HomeContentModel.fromJson(Map<String, dynamic> json) => _$HomeContentModelFromJson(json);

 final  List<HomeCategoryModel> _categories;
@override List<HomeCategoryModel> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

 final  List<HomeSubcategoryModel> _subcategories;
@override List<HomeSubcategoryModel> get subcategories {
  if (_subcategories is EqualUnmodifiableListView) return _subcategories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_subcategories);
}

 final  List<HomeOfferModel> _offers;
@override List<HomeOfferModel> get offers {
  if (_offers is EqualUnmodifiableListView) return _offers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_offers);
}

 final  List<HomeHotelDealModel> _hotelDeals;
@override List<HomeHotelDealModel> get hotelDeals {
  if (_hotelDeals is EqualUnmodifiableListView) return _hotelDeals;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_hotelDeals);
}

 final  List<HomeTopFlightsModel> _topFlights;
@override List<HomeTopFlightsModel> get topFlights {
  if (_topFlights is EqualUnmodifiableListView) return _topFlights;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_topFlights);
}

 final  List<HomeDynamicBannerModel> _dynamicBanners;
@override List<HomeDynamicBannerModel> get dynamicBanners {
  if (_dynamicBanners is EqualUnmodifiableListView) return _dynamicBanners;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_dynamicBanners);
}


/// Create a copy of HomeContentModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeContentModelCopyWith<_HomeContentModel> get copyWith => __$HomeContentModelCopyWithImpl<_HomeContentModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HomeContentModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeContentModel&&const DeepCollectionEquality().equals(other.categories, _categories)&&const DeepCollectionEquality().equals(other.subcategories, _subcategories)&&const DeepCollectionEquality().equals(other.offers, _offers)&&const DeepCollectionEquality().equals(other.hotelDeals, _hotelDeals)&&const DeepCollectionEquality().equals(other.topFlights, _topFlights)&&const DeepCollectionEquality().equals(other.dynamicBanners, _dynamicBanners));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_categories),const DeepCollectionEquality().hash(_subcategories),const DeepCollectionEquality().hash(_offers),const DeepCollectionEquality().hash(_hotelDeals),const DeepCollectionEquality().hash(_topFlights),const DeepCollectionEquality().hash(_dynamicBanners));
}

@override
String toString() {
    return 'HomeContentModel(categories: $categories, subcategories: $subcategories, offers: $offers, hotelDeals: $hotelDeals, topFlights: $topFlights, dynamicBanners: $dynamicBanners)';
}


}

/// @nodoc
abstract mixin class _$HomeContentModelCopyWith<$Res> implements $HomeContentModelCopyWith<$Res> {
  factory _$HomeContentModelCopyWith(_HomeContentModel value, $Res Function(_HomeContentModel) _then) = __$HomeContentModelCopyWithImpl;
@override @useResult
$Res call({
 List<HomeCategoryModel> categories, List<HomeSubcategoryModel> subcategories, List<HomeOfferModel> offers, List<HomeHotelDealModel> hotelDeals, List<HomeTopFlightsModel> topFlights, List<HomeDynamicBannerModel> dynamicBanners
});




}
/// @nodoc
class __$HomeContentModelCopyWithImpl<$Res>
    implements _$HomeContentModelCopyWith<$Res> {
  __$HomeContentModelCopyWithImpl(this._self, this._then);

  final _HomeContentModel _self;
  final $Res Function(_HomeContentModel) _then;

/// Create a copy of HomeContentModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categories = null,Object? subcategories = null,Object? offers = null,Object? hotelDeals = null,Object? topFlights = null,Object? dynamicBanners = null,}) {
  return _then(_HomeContentModel(
categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<HomeCategoryModel>,subcategories: null == subcategories ? _self._subcategories : subcategories // ignore: cast_nullable_to_non_nullable
as List<HomeSubcategoryModel>,offers: null == offers ? _self._offers : offers // ignore: cast_nullable_to_non_nullable
as List<HomeOfferModel>,hotelDeals: null == hotelDeals ? _self._hotelDeals : hotelDeals // ignore: cast_nullable_to_non_nullable
as List<HomeHotelDealModel>,topFlights: null == topFlights ? _self._topFlights : topFlights // ignore: cast_nullable_to_non_nullable
as List<HomeTopFlightsModel>,dynamicBanners: null == dynamicBanners ? _self._dynamicBanners : dynamicBanners // ignore: cast_nullable_to_non_nullable
as List<HomeDynamicBannerModel>,
  ));
}


}

// dart format on
