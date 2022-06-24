class Flight {

  String id;
  String departureLocationName;
  String departureLocationSymbol;
  String arrivalLocationName;
  String arrivalLocationSymbol;
  String departureDate;
  String departureTime;
  String arrivalDate;
  String arrivalTime;
  String flightTimeDuration;
  int economyRemainingSeats;
  int economyTicketPrice;
  int businessRemainingSeats;
  int businessTicketPrice;

  Flight({
    required this.id,
    required this.departureLocationName,
    required this.departureLocationSymbol,
    required this.arrivalLocationName,
    required this.arrivalLocationSymbol,
    required this.departureDate,
    required this.departureTime,
    required this.arrivalDate,
    required this.arrivalTime,
    required this.flightTimeDuration,
    required this.economyRemainingSeats,
    required this.economyTicketPrice,
    required this.businessRemainingSeats,
    required this.businessTicketPrice,
  });

  Flight fromJson(Map<String, dynamic> json) => Flight(
    id: json['id'],
    departureLocationName: json['departureLocationName'],
    departureLocationSymbol: json['departureLocationSymbol'],
    arrivalLocationName: json['arrivalLocationName'],
    arrivalLocationSymbol: json['arrivalLocationSymbol'],
    departureDate: json['departureDate'],
    departureTime: json['departureTime'],
    arrivalDate: json['arrivalDate'],
    arrivalTime: json['arrivalTime'],
    flightTimeDuration: json['flightTimeDuration'],
    economyRemainingSeats: json['economyRemainingSeats'],
    economyTicketPrice: json['economyTicketPrice'],
    businessRemainingSeats: json['businessRemainingSeats'],
    businessTicketPrice: json['businessTicketPrice'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'departureLocationName': departureLocationName,
    'departureLocationSymbol': departureLocationSymbol,
    'arrivalLocationName': arrivalLocationName,
    'arrivalLocationSymbol': arrivalLocationSymbol,
    'departureDate': departureDate,
    'departureTime': departureTime,
    'arrivalDate': arrivalDate,
    'arrivalTime': arrivalTime,
    'flightTimeDuration': flightTimeDuration,
    'economyRemainingSeats': economyRemainingSeats,
    'economyTicketPrice': economyTicketPrice,
    'businessRemainingSeats': businessRemainingSeats,
    'businessTicketPrice': businessTicketPrice,
  };

}