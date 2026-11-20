class PopularDestinationModel {
  final String image;
  final String countryName;
  final String city;

  const PopularDestinationModel({
    required this.image,
    required this.countryName,
    required this.city,
  });

  factory PopularDestinationModel.fromJson(Map<String, dynamic> json) {
    return PopularDestinationModel(
      image: json['image'] as String? ?? '',
      countryName: json['countryName'] as String? ?? '',
      city: json['city'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'image': image, 'countryName': countryName, 'city': city};
  }

  PopularDestinationModel copyWith({
    String? image,
    String? countryName,
    String? city,
  }) {
    return PopularDestinationModel(
      image: image ?? this.image,
      countryName: countryName ?? this.countryName,
      city: city ?? this.city,
    );
  }
}
