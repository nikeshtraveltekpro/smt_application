




part of 'home_hotel_deal_model.dart';







T _$identity<T>(T value) => value;


mixin _$HomeHotelDealModel {

 int? get id; String? get title; String? get image; String? get location; double? get rating; String? get review; String? get price; String? get taxAmount;


@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeHotelDealModelCopyWith<HomeHotelDealModel> get copyWith => _$HomeHotelDealModelCopyWithImpl<HomeHotelDealModel>(this as HomeHotelDealModel, _$identity);


  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as HomeHotelDealModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeHotelDealModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.image, _this.image) || other.image == _this.image)&&(identical(other.location, _this.location) || other.location == _this.location)&&(identical(other.rating, _this.rating) || other.rating == _this.rating)&&(identical(other.review, _this.review) || other.review == _this.review)&&(identical(other.price, _this.price) || other.price == _this.price)&&(identical(other.taxAmount, _this.taxAmount) || other.taxAmount == _this.taxAmount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as HomeHotelDealModel;
  return Object.hash(runtimeType,_this.id,_this.title,_this.image,_this.location,_this.rating,_this.review,_this.price,_this.taxAmount);
}

@override
String toString() {
  final _this = this as HomeHotelDealModel;
  return 'HomeHotelDealModel(id: ${_this.id}, title: ${_this.title}, image: ${_this.image}, location: ${_this.location}, rating: ${_this.rating}, review: ${_this.review}, price: ${_this.price}, taxAmount: ${_this.taxAmount})';
}


}


abstract mixin class $HomeHotelDealModelCopyWith<$Res>  {
  factory $HomeHotelDealModelCopyWith(HomeHotelDealModel value, $Res Function(HomeHotelDealModel) _then) = _$HomeHotelDealModelCopyWithImpl;
@useResult
$Res call({
 int? id, String? title, String? image, String? location, double? rating, String? review, String? price, String? taxAmount
});




}

class _$HomeHotelDealModelCopyWithImpl<$Res>
    implements $HomeHotelDealModelCopyWith<$Res> {
  _$HomeHotelDealModelCopyWithImpl(this._self, this._then);

  final HomeHotelDealModel _self;
  final $Res Function(HomeHotelDealModel) _then;



@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? title = freezed,Object? image = freezed,Object? location = freezed,Object? rating = freezed,Object? review = freezed,Object? price = freezed,Object? taxAmount = freezed,}) {
  return _then(HomeHotelDealModel(
id: freezed == id ? _self.id : id
as int?,title: freezed == title ? _self.title : title
as String?,image: freezed == image ? _self.image : image
as String?,location: freezed == location ? _self.location : location
as String?,rating: freezed == rating ? _self.rating : rating
as double?,review: freezed == review ? _self.review : review
as String?,price: freezed == price ? _self.price : price
as String?,taxAmount: freezed == taxAmount ? _self.taxAmount : taxAmount
as String?,
  ));
}

}



extension HomeHotelDealModelPatterns on HomeHotelDealModel {












@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeHotelDealModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeHotelDealModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}













@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeHotelDealModel value)  $default,){
final _that = this;
switch (_that) {
case _HomeHotelDealModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}












@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeHotelDealModel value)?  $default,){
final _that = this;
switch (_that) {
case _HomeHotelDealModel() when $default != null:
return $default(_that);case _:
  return null;

}
}












@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? title,  String? image,  String? location,  double? rating,  String? review,  String? price,  String? taxAmount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeHotelDealModel() when $default != null:
return $default(_that.id,_that.title,_that.image,_that.location,_that.rating,_that.review,_that.price,_that.taxAmount);case _:
  return orElse();

}
}













@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? title,  String? image,  String? location,  double? rating,  String? review,  String? price,  String? taxAmount)  $default,) {final _that = this;
switch (_that) {
case _HomeHotelDealModel():
return $default(_that.id,_that.title,_that.image,_that.location,_that.rating,_that.review,_that.price,_that.taxAmount);case _:
  throw StateError('Unexpected subclass');

}
}












@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? title,  String? image,  String? location,  double? rating,  String? review,  String? price,  String? taxAmount)?  $default,) {final _that = this;
switch (_that) {
case _HomeHotelDealModel() when $default != null:
return $default(_that.id,_that.title,_that.image,_that.location,_that.rating,_that.review,_that.price,_that.taxAmount);case _:
  return null;

}
}

}


@JsonSerializable()

class _HomeHotelDealModel implements HomeHotelDealModel {
  const _HomeHotelDealModel({this.id, this.title = 'No Title', this.image, this.location, this.rating, this.review, this.price, this.taxAmount});
  factory _HomeHotelDealModel.fromJson(Map<String, dynamic> json) => _$HomeHotelDealModelFromJson(json);

@override final  int? id;
@override@JsonKey() final  String? title;
@override final  String? image;
@override final  String? location;
@override final  double? rating;
@override final  String? review;
@override final  String? price;
@override final  String? taxAmount;



@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeHotelDealModelCopyWith<_HomeHotelDealModel> get copyWith => __$HomeHotelDealModelCopyWithImpl<_HomeHotelDealModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HomeHotelDealModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeHotelDealModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.image, image) || other.image == image)&&(identical(other.location, location) || other.location == location)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.review, review) || other.review == review)&&(identical(other.price, price) || other.price == price)&&(identical(other.taxAmount, taxAmount) || other.taxAmount == taxAmount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,title,image,location,rating,review,price,taxAmount);
}

@override
String toString() {
    return 'HomeHotelDealModel(id: $id, title: $title, image: $image, location: $location, rating: $rating, review: $review, price: $price, taxAmount: $taxAmount)';
}


}


abstract mixin class _$HomeHotelDealModelCopyWith<$Res> implements $HomeHotelDealModelCopyWith<$Res> {
  factory _$HomeHotelDealModelCopyWith(_HomeHotelDealModel value, $Res Function(_HomeHotelDealModel) _then) = __$HomeHotelDealModelCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? title, String? image, String? location, double? rating, String? review, String? price, String? taxAmount
});




}

class __$HomeHotelDealModelCopyWithImpl<$Res>
    implements _$HomeHotelDealModelCopyWith<$Res> {
  __$HomeHotelDealModelCopyWithImpl(this._self, this._then);

  final _HomeHotelDealModel _self;
  final $Res Function(_HomeHotelDealModel) _then;



@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? title = freezed,Object? image = freezed,Object? location = freezed,Object? rating = freezed,Object? review = freezed,Object? price = freezed,Object? taxAmount = freezed,}) {
  return _then(_HomeHotelDealModel(
id: freezed == id ? _self.id : id
as int?,title: freezed == title ? _self.title : title
as String?,image: freezed == image ? _self.image : image
as String?,location: freezed == location ? _self.location : location
as String?,rating: freezed == rating ? _self.rating : rating
as double?,review: freezed == review ? _self.review : review
as String?,price: freezed == price ? _self.price : price
as String?,taxAmount: freezed == taxAmount ? _self.taxAmount : taxAmount
as String?,
  ));
}


}


