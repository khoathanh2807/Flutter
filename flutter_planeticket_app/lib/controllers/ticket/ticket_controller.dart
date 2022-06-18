import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../controllers/notification/notification_controller.dart';
import '../../models/ticket.dart';

class TicketController {

  final currentUser = FirebaseAuth.instance.currentUser;

  void createTicket({
    required String departureLocationName,
    required String arrivalLocationName,
    required String departureLocationSymbol,
    required String arrivalLocationSymbol,
    required String departureDate,
    required String arrivalDate,
    required String departureTime,
    required String arrivalTime,
    required String flightTimeDuration,
    required String seatClass,
    required int ticketPrice,
    required String ticketType,
    required String flightID,
    required String ticketID,
    required int amount, }) async {

    await FirebaseFirestore.instance.collection('users').doc(currentUser!.uid).collection('tickets').doc(ticketID).set({
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

  }

  Future<Ticket> getTicketInfo(String ticketID) async {

    Ticket ticket = Ticket().createDefault();

    await FirebaseFirestore.instance.collection('users').doc(currentUser!.uid).collection('tickets').doc(ticketID).get().then((value) {
      ticket.departureLocationName = value.get('departureLocationName').toString();
      ticket.arrivalLocationName = value.get('arrivalLocationName').toString();
      ticket.departureLocationSymbol = value.get('departureLocationSymbol').toString();
      ticket.arrivalLocationSymbol = value.get('arrivalLocationSymbol').toString();
      ticket.departureDate = value.get('departureDate').toString();
      ticket.arrivalDate = value.get('arrivalDate').toString();
      ticket.departureTime = value.get('departureTime').toString();
      ticket.arrivalTime = value.get('arrivalTime').toString();
      ticket.flightTimeDuration = value.get('flightTimeDuration').toString();
      ticket.seatClass = value.get('seatClass').toString();
      ticket.ticketPrice = value.get('ticketPrice').toInt();
      ticket.ticketType = value.get('ticketType').toString();
      ticket.flightID = value.get('flightID').toString();
      ticket.ticketID = value.get('ticketID').toString();
      ticket.amount = value.get('amount').toInt();
    });

    return ticket;

  }

  void ticketSuccessBookingNotification() async {

    await NotificationController().showNotificationCustomSound(
      'Mua Vé Thành Công!',
      'Vé đã được thêm vào tài khoản, hãy kiểm tra vé ở mục Lịch sử đặt vé.',
      null,
    );

  }

  void ticketScheduleNotification({
    required String departureLocationName,
    required String arrivalLocationName,
    required String departureLocationSymbol,
    required String arrivalLocationSymbol,
    required String departureDate,
    required String departureTime, }) async {

    await NotificationController().scheduleNotificationOneDayBeforeAt10AM(
      'Đừng Quên Chuyến Bay Vào Ngày Mai Của Bạn!',
      'Chuyến bay $departureLocationName ($departureLocationSymbol) - $arrivalLocationName ($arrivalLocationSymbol) của bạn sẽ khởi hành vào ngày mai $departureDate lúc $departureTime.',
      null,     // payload
      DateFormat('dd.MM.yyyy').parse(departureDate),
    );

  }

}