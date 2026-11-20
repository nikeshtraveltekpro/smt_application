import 'package:smt_application/src/modules/flights/models/flight_destination_model.dart';

class FlightRecentSearchModel {
  final String? id;
  final FlightDestinationModel fromCity;
  final FlightDestinationModel toCity;
  final String departureDate;
  final int travellers;
  final String travelClass;
  final String? arrivalDate;
  final String? arrivalTime;
  final String? departureTime;
  final String? specialFare;

  const FlightRecentSearchModel({
    required this.fromCity,
    required this.toCity,
    required this.departureDate,
    required this.travellers,
    required this.travelClass,
    this.id,
    this.arrivalDate,
    this.arrivalTime,
    this.departureTime,
    this.specialFare,
  });

  factory FlightRecentSearchModel.fromJson(Map<String, dynamic> json) {
    return FlightRecentSearchModel(
      fromCity: FlightDestinationModel.fromJson(
        json['fromCity'] as Map<String, dynamic>? ?? {},
      ),
      toCity: FlightDestinationModel.fromJson(
        json['toCity'] as Map<String, dynamic>? ?? {},
      ),
      departureDate: json['departureDate'] as String? ?? '',
      travellers: json['travellers'] as int? ?? 1,
      travelClass: json['travelClass'] as String? ?? 'Economy',
      id: json['id'] as String?,
      arrivalDate: json['arrivalDate'] as String?,
      arrivalTime: json['arrivalTime'] as String?,
      departureTime: json['departureTime'] as String?,
      specialFare: json['specialFare'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fromCity': fromCity.toJson(),
      'toCity': toCity.toJson(),
      'departureDate': departureDate,
      'travellers': travellers,
      'travelClass': travelClass,
      if (id != null) 'id': id,
      if (arrivalDate != null) 'arrivalDate': arrivalDate,
      if (arrivalTime != null) 'arrivalTime': arrivalTime,
      if (departureTime != null) 'departureTime': departureTime,
      if (specialFare != null) 'specialFare': specialFare,
    };
  }

  FlightRecentSearchModel copyWith({
    FlightDestinationModel? fromCity,
    FlightDestinationModel? toCity,
    String? departureDate,
    int? travellers,
    String? travelClass,
    String? id,
    String? arrivalDate,
    String? arrivalTime,
    String? departureTime,
    String? specialFare,
  }) {
    return FlightRecentSearchModel(
      fromCity: fromCity ?? this.fromCity,
      toCity: toCity ?? this.toCity,
      departureDate: departureDate ?? this.departureDate,
      travellers: travellers ?? this.travellers,
      travelClass: travelClass ?? this.travelClass,
      id: id ?? this.id,
      arrivalDate: arrivalDate ?? this.arrivalDate,
      arrivalTime: arrivalTime ?? this.arrivalTime,
      departureTime: departureTime ?? this.departureTime,
      specialFare: specialFare ?? this.specialFare,
    );
  }
}
