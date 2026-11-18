class HomeDynamicBannerModel {
  String title;
  String description;
  String? promoCode;
  String? descriptionSuffix;
  String bgImage;
  String? extraImage;

  HomeDynamicBannerModel({
    required this.title,
    required this.description,
    this.promoCode,
    this.descriptionSuffix,
    required this.bgImage,
    this.extraImage,
  });

  factory HomeDynamicBannerModel.fromJson(Map<String, dynamic> json) {
    return HomeDynamicBannerModel(
      title: json['title']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
      promoCode: json['promo_code']?.toString(),
      descriptionSuffix: json['description_suffix']?.toString(),
      bgImage: json['bg_image']?.toString() ?? '',
      extraImage: json['extra_image']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'promo_code': promoCode,
      'description_suffix': descriptionSuffix,
      'bg_image': bgImage,
      'extra_image': extraImage,
    };
  }
}
