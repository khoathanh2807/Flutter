import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/airport.dart';

class AirportController {

  Future<void> createAirport(Airport airport) async {

    await FirebaseFirestore.instance.collection('locations').doc(airport.locationSymbol).set({
      'name': airport.locationName,
      'symbol': airport.locationSymbol,
      'airport': airport.airport,
    });

  }

}