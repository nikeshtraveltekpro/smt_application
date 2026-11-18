class HomeCategoryModel {
  int id;
  String title;
  String icon;
  String route;

  HomeCategoryModel({
    required this.id,
    required this.title,
    required this.icon,
    required this.route,
  });

  factory HomeCategoryModel.fromJson(Map<String, dynamic> json) {
    return HomeCategoryModel(
      id: json['id'],
      title: json['title'],
      icon: json['icon'],
      route: json['route'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'icon': icon,
      'route': route,
    };
  }
}
