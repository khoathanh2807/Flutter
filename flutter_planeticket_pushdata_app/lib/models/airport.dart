class Airport {

  String locationName;
  String locationSymbol;
  String airport;

  Airport({
    required this.locationName,
    required this.locationSymbol,
    required this.airport,
  });

  Airport fromJson(Map<String, dynamic> json) => Airport(
    locationName: json['locationName'],
    locationSymbol: json['locationSymbol'],
    airport: json['airport'],
  );

  Map<String, dynamic> toJson() => {
    'locationName': locationName,
    'locationSymbol': locationSymbol,
    'airport': airport,
  };

}