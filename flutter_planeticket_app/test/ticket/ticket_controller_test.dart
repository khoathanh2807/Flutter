import 'package:flutter_test/flutter_test.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';

void main() async{

  const String departureLocationName = 'Buôn Mê Thuộc';
  const String arrivalLocationName = 'Tp. Hồ Chí Minh';
  const String departureLocationSymbol  = 'SGN';
  const String arrivalLocationSymbol  = 'BMV';
  const String departureDate  = '30.06.2022';
  const String arrivalDate  = '30.06.2022';
  const String departureTime  = '10:20';
  const String arrivalTime  = '11:10';
  const String flightTimeDuration  = '2h30';
  const String seatClass  = 'Economy';
  const int ticketPrice  = 4500000;
  const String ticketType  = '5-Adult';
  const String flightID  = 'SGN-BMV-30.06.2022-10:20';
  const String ticketID  = '5-Adult-SGN-BMV-30.06.2022';
  const int amount = 4;

  testWidgets("Test create ticket function and get ticket function", (WidgetTester tester) async{

    final instance = FakeFirebaseFirestore();

    await instance.collection('tickets').doc(ticketID).set({
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
    });

    print(instance.dump());

    final snapshot = await instance.collection('tickets').get();

    expect(snapshot.docs.first.get('departureLocationName').toString(), departureLocationName);
    expect(snapshot.docs.first.get('arrivalLocationName'), arrivalLocationName);
    expect(snapshot.docs.first.get('departureLocationSymbol'), departureLocationSymbol);
    expect(snapshot.docs.first.get('arrivalLocationSymbol'), arrivalLocationSymbol);
    expect(snapshot.docs.first.get('departureDate'), departureDate);
    expect(snapshot.docs.first.get('arrivalDate'), arrivalDate);
    expect(snapshot.docs.first.get('departureTime'), departureTime);
    expect(snapshot.docs.first.get('arrivalTime'), arrivalTime);
    expect(snapshot.docs.first.get('flightTimeDuration'), flightTimeDuration);
    expect(snapshot.docs.first.get('seatClass'), seatClass);
    expect(snapshot.docs.first.get('ticketPrice'), ticketPrice);
    expect(snapshot.docs.first.get('ticketType'), ticketType);
    expect(snapshot.docs.first.get('flightID'), flightID);
    expect(snapshot.docs.first.get('ticketID'), ticketID);
    expect(snapshot.docs.first.get('amount'), amount);

  });

}