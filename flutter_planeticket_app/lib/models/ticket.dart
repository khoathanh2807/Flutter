class Ticket{

    String? departureLocationName;
    String? arrivalLocationName;
    String? departureLocationSymbol;
    String? arrivalLocationSymbol;
    String? departureDate;
    String? arrivalDate;
    String? departureTime;
    String? arrivalTime;
    String? flightTimeDuration;
    String? seatClass;
    int? ticketPrice;
    String? ticketType;
    String? flightID;
    String? ticketID;
    int? amount;

    Ticket({
        this.departureLocationName,
        this.arrivalLocationName,
        this.departureLocationSymbol,
        this.arrivalLocationSymbol,
        this.departureDate,
        this.arrivalDate,
        this.departureTime,
        this.arrivalTime,
        this.flightTimeDuration,
        this.seatClass,
        this.ticketPrice,
        this.ticketType,
        this.flightID,
        this.ticketID,
        this.amount,
    });

    Ticket createDefault() => Ticket(
        departureLocationName: '',
        arrivalLocationName: '',
        departureLocationSymbol: '',
        arrivalLocationSymbol: '',
        departureDate: '',
        arrivalDate: '',
        departureTime: '',
        arrivalTime: '',
        flightTimeDuration: '',
        seatClass: '',
        ticketPrice: 0,
        ticketType: '',
        flightID: '',
        ticketID: '',
        amount: 1,
    );

    Ticket fromJson(Map<String, dynamic> json) => Ticket(
        departureLocationName: json['departureLocationName'],
        arrivalLocationName: json['arrivalLocationName'],
        departureLocationSymbol: json['departureLocationSymbol'],
        arrivalLocationSymbol: json['arrivalLocationSymbol'],
        departureDate: json['departureDate'],
        arrivalDate: json['arrivalDate'],
        departureTime: json['departureTime'],
        arrivalTime: json['arrivalTime'],
        flightTimeDuration: json['flightTimeDuration'],
        seatClass: json['seatClass'],
        ticketPrice: json['ticketPrice'],
        ticketType: json['ticketType'],
        flightID: json['flightID'],
        ticketID: json['ticketID'],
        amount: json['amount'],
    );

    Map<String, dynamic> toJson() => {
        'departureLocationName': departureLocationName,
        'arrivalLocationName': arrivalLocationName,
        'departureLocationSymbol': departureLocationSymbol,
        'arrivalLocationSymbol': arrivalLocationSymbol,
        'departureDate': departureDate,
        'arrivalDate': arrivalDate,
        'departureTime': departureTime,
        'arrivalTime': arrivalTime,
        'flightTimeDuration': flightTimeDuration,
        'seatClass': seatClass,
        'ticketPrice': ticketPrice,
        'ticketType': ticketType,
        'flightID': flightID,
        'ticketID': ticketID,
        'amount': amount,
    };

}