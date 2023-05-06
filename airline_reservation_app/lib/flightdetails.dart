class Flight {
  final String tripType;
  final String countryFrom;
  final String countryTo;
  final String departDate;
  final String returnDate;

  Flight(
      {required this.tripType,
      required this.countryFrom,
      required this.countryTo,
      required this.departDate,
      required this.returnDate});

  factory Flight.fromJson(Map<String, dynamic> json) {
    return Flight(
        tripType: json['tripType'],
        countryFrom: json['countryFrom'],
        countryTo: json['countryTo'],
        departDate: json['departDate'],
        returnDate: json['returnDate']);
  }

  Map<String, dynamic> toJson() => {
        'tripType': tripType,
        'countryFrom': countryFrom,
        'countryTo': countryTo,
        'departDate': departDate,
        'returnDate': returnDate
      };
}
