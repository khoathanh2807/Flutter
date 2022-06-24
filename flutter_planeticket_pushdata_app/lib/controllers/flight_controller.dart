import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/flight.dart';

class FlightController {

  Future<void> createFlight(Flight flight) async {

    await FirebaseFirestore.instance.collection('flights').doc(flight.id).set({
      'id': flight.id,
      'departureLocationName': flight.departureLocationName,
      'departureLocationSymbol': flight.departureLocationSymbol,
      'arrivalLocationName': flight.arrivalLocationName,
      'arrivalLocationSymbol': flight.arrivalLocationSymbol,
      'departureDate': flight.departureDate,
      'departureTime': flight.departureTime,
      'arrivalDate': flight.arrivalDate,
      'arrivalTime': flight.arrivalTime,
      'flightTimeDuration': flight.flightTimeDuration,
      'economyRemainingSeats': flight.economyRemainingSeats,
      'economyTicketPrice': flight.economyTicketPrice,
      'businessRemainingSeats': flight.businessRemainingSeats,
      'businessTicketPrice': flight.businessTicketPrice,
    });

  }

}