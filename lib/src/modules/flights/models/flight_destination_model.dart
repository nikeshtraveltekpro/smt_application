class FlightDestinationModel {
  final String city;
  final String airport;

  const FlightDestinationModel({required this.city, required this.airport});

  factory FlightDestinationModel.fromJson(Map<String, dynamic> json) {
    return FlightDestinationModel(
      city: json['city'] as String? ?? '',
      airport: json['airport'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'city': city, 'airport': airport};
  }
}
