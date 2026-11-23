class FlightPopularRoutesModel {
  String fromCity;
  String toCity;
  String fromCityCode;
  String toCityCode;

  FlightPopularRoutesModel({
    required this.fromCity,
    required this.toCity,
    required this.fromCityCode,
    required this.toCityCode,
  });

  factory FlightPopularRoutesModel.fromJson(Map<String, dynamic> json) {
    return FlightPopularRoutesModel(
      fromCity: json['fromCity'] ?? '',
      toCity: json['toCity'] ?? '',
      fromCityCode: json['fromCityCode'] ?? '',
      toCityCode: json['toCityCode'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fromCity': fromCity,
      'toCity': toCity,
      'fromCityCode': fromCityCode,
      'toCityCode': toCityCode,
    };
  }

  FlightPopularRoutesModel copyWith({
    String? fromCity,
    String? toCity,
    String? fromCityCode,
    String? toCityCode,
  }) {
    return FlightPopularRoutesModel(
      fromCity: fromCity ?? this.fromCity,
      toCity: toCity ?? this.toCity,
      fromCityCode: fromCityCode ?? this.fromCityCode,
      toCityCode: toCityCode ?? this.toCityCode,
    );
  }
}
