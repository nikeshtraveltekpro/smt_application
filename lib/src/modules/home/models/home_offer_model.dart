class HomeOfferModel {
  final int id;
  final String image;
  final String title;
  final String promoCode;
  final String categoryId;

  HomeOfferModel({
    required this.id,
    required this.image,
    required this.title,
    required this.promoCode,
    required this.categoryId,
  });

  factory HomeOfferModel.fromJson(Map<String, dynamic> json) {
    return HomeOfferModel(
      id: json['id'],
      image: json['image'],
      title: json['title'],
      promoCode: json['promo_code'],
      categoryId: json['category_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'title': title,
      'category_id': categoryId,
    };
  }
}
