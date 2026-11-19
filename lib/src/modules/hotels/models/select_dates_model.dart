class SelectDatesModel {
  final DateTime? checkInDate;
  final DateTime? checkOutDate;
  final int nights;

  const SelectDatesModel({
    this.checkInDate,
    this.checkOutDate,
    this.nights = 0,
  });

  factory SelectDatesModel.fromJson(Map<String, dynamic> json) =>
      SelectDatesModel(
        checkInDate: json['checkInDate'] != null
            ? DateTime.parse(json['checkInDate'] as String)
            : null,
        checkOutDate: json['checkOutDate'] != null
            ? DateTime.parse(json['checkOutDate'] as String)
            : null,
        nights: (json['nights'] as int?) ?? 0,
      );

  Map<String, dynamic> toJson() => {
    'checkInDate': checkInDate?.toIso8601String(),
    'checkOutDate': checkOutDate?.toIso8601String(),
    'nights': nights,
  };
}
