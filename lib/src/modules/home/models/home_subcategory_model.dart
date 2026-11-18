class HomeSubcategoryModel {
  final int id;
  final String title;
  final String icon;

  HomeSubcategoryModel({
    required this.id,
    required this.title,
    required this.icon,
  });

  factory HomeSubcategoryModel.fromJson(Map<String, dynamic> json) {
    return HomeSubcategoryModel(
      id: json['id'],
      title: json['title'],
      icon: json['icon'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'title': title, 'icon': icon};
  }
}
