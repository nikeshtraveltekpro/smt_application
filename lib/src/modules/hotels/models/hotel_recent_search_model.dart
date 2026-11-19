class HotelRecentSearchModel {
  final String city;
  final String country;
  final String dateIn;
  final String dateOut;
  final String fullCheckIn;
  final String fullCheckInDay;
  final String fullCheckOut;
  final String fullCheckOutDay;
  final String rooms;
  final String guests;

  HotelRecentSearchModel({
    required this.city,
    required this.country,
    required this.dateIn,
    required this.dateOut,
    required this.fullCheckIn,
    required this.fullCheckInDay,
    required this.fullCheckOut,
    required this.fullCheckOutDay,
    required this.rooms,
    required this.guests,
  });

  factory HotelRecentSearchModel.fromJson(Map<String, dynamic> json) {
    return HotelRecentSearchModel(
      city: json['city'] ?? '',
      country: json['country'] ?? '',
      dateIn: json['dateIn'] ?? '',
      dateOut: json['dateOut'] ?? '',
      fullCheckIn: json['fullCheckIn'] ?? '',
      fullCheckInDay: json['fullCheckInDay'] ?? '',
      fullCheckOut: json['fullCheckOut'] ?? '',
      fullCheckOutDay: json['fullCheckOutDay'] ?? '',
      rooms: json['rooms'] ?? '',
      guests: json['guests'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'city': city,
      'country': country,
      'dateIn': dateIn,
      'dateOut': dateOut,
      'fullCheckIn': fullCheckIn,
      'fullCheckInDay': fullCheckInDay,
      'fullCheckOut': fullCheckOut,
      'fullCheckOutDay': fullCheckOutDay,
      'rooms': rooms,
      'guests': guests,
    };
  }
}
