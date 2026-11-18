class HomeTopFlightsModel {
  int id;
  String title;
  String image;
  String subtitle;

  HomeTopFlightsModel({
    required this.id,
    required this.title,
    required this.image,
    required this.subtitle,
  });

  factory HomeTopFlightsModel.fromJson(Map<String, dynamic> json) {
    return HomeTopFlightsModel(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      subtitle: json['subtitle'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'title': title, 'image': image, 'subtitle': subtitle};
  }
}
