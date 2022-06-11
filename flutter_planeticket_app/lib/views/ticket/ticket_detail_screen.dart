import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../../controllers/ticket/ticket_controller.dart';
import '../../models/ticket.dart';

class TicketDetailScreen extends StatefulWidget {

  TicketDetailScreen({required this.ticketID});

  final String ticketID;

  @override
  State<TicketDetailScreen> createState() => _TicketDetailScreenState();

}

class _TicketDetailScreenState extends State<TicketDetailScreen> {

  Ticket ticket = Ticket().createDefault();

  @override
  void initState() {

    TicketController().getTicketInfo(widget.ticketID).then((value) => ticket = value).whenComplete(() {
      setState(() {
      });
    });

    super.initState();

  }

  @override
  Widget build(BuildContext context) {

      return Scaffold(

        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey[200],

        appBar: AppBar(
          // elevation: 0,
          centerTitle: true,
          // title: Text('Thông tin vé ' + ticket.departureLocationSymbol! + ' - ' + ticket.arrivalLocationSymbol!, style: TextStyle(fontWeight: FontWeight.w600,),),
          title: Text('Thông tin chi tiết vé', style: TextStyle(fontWeight: FontWeight.w600,),),
        ),

        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 25, horizontal: 15,),
            child: Container(

              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20,),

              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(12)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black38,
                    blurRadius: 3,
                    offset: Offset(5, 5),
                  )
                ],
              ),

              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Center(
                        child: Text('Mã số vé', style: TextStyle(fontWeight: FontWeight.w500,), textAlign: TextAlign.center,),
                    ),
                    SizedBox(height: 10,),

                    Text(ticket.ticketID!, style: TextStyle(fontWeight: FontWeight.bold,), maxLines: 3, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center,),
                    SizedBox(height: 15,),

                    const Divider(
                      height: 0,
                      color: Colors.grey,
                      thickness: 0.1,
                    ),
                    SizedBox(height: 15,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Text('Điểm đi', style: TextStyle(fontStyle: FontStyle.italic,),),
                              SizedBox(height: 12,),
                              Text(ticket.departureTime!, style: TextStyle(fontWeight: FontWeight.bold,),),
                              SizedBox(height: 5,),
                              Text(ticket.departureDate!,),
                              SizedBox(height: 8,),
                              Text(ticket.departureLocationSymbol!, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Theme.of(context).primaryColor,),),
                              SizedBox(height: 8,),
                              Text(ticket.departureLocationName!, style: TextStyle(fontWeight: FontWeight.bold,),),
                            ],
                          ),
                        ),
                        SizedBox(width: 20,),
                        Column(
                          children: [
                            Text(ticket.flightTimeDuration!, style: TextStyle(fontSize: 13,),),
                            SizedBox(height: 6,),
                            Icon(FontAwesomeIcons.plane, size: 20,),   // color: Theme.of(context).primaryColor,
                          ],
                        ),
                        SizedBox(width: 20,),
                        Expanded(
                          child: Column(
                            children: [
                              Text('Điểm đến', style: TextStyle(fontStyle: FontStyle.italic,),),
                              SizedBox(height: 12,),
                              Text(ticket.arrivalTime!, style: TextStyle(fontWeight: FontWeight.bold,),),
                              SizedBox(height: 5,),
                              Text(ticket.arrivalDate!,),
                              SizedBox(height: 8,),
                              Text(ticket.arrivalLocationSymbol!, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Theme.of(context).primaryColor,),),
                              SizedBox(height: 8,),
                              Text(ticket.arrivalLocationName!, style: TextStyle(fontWeight: FontWeight.bold,),),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15,),

                    const Divider(
                      height: 0,
                      color: Colors.grey,
                      thickness: 0.1,
                    ),
                    SizedBox(height: 15,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Mã số chuyến bay', style: TextStyle(fontWeight: FontWeight.w500,),),
                        Text(ticket.flightID!, style: TextStyle(fontWeight: FontWeight.bold,),),
                      ],
                    ),
                    SizedBox(height: 15,),

                    const Divider(
                      height: 0,
                      color: Colors.grey,
                      thickness: 0.1,
                    ),
                    SizedBox(height: 15,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Hạng ghế', style: TextStyle(fontWeight: FontWeight.w500,),),
                        Text(ticket.seatClass!, style: TextStyle(fontWeight: FontWeight.bold,),),
                      ],
                    ),
                    SizedBox(height: 15,),

                    const Divider(
                      height: 0,
                      color: Colors.grey,
                      thickness: 0.1,
                    ),
                    SizedBox(height: 15,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Loại vé', style: TextStyle(fontWeight: FontWeight.w500,),),
                        Text(ticket.ticketType!, style: TextStyle(fontWeight: FontWeight.bold,),),
                      ],
                    ),
                    SizedBox(height: 15,),

                    const Divider(
                      height: 0,
                      color: Colors.grey,
                      thickness: 0.1,
                    ),
                    SizedBox(height: 15,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Giá vé', style: TextStyle(fontWeight: FontWeight.w500,),),
                        Text(NumberFormat.decimalPattern().format(ticket.ticketPrice) + ' VND', style: TextStyle(fontWeight: FontWeight.bold,),),
                      ],
                    ),
                    SizedBox(height: 15,),

                    const Divider(
                      height: 0,
                      color: Colors.grey,
                      thickness: 0.1,
                    ),
                    SizedBox(height: 15,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Số lượng', style: TextStyle(fontWeight: FontWeight.w500,),),
                        Text(ticket.amount.toString() + ' vé', style: TextStyle(fontWeight: FontWeight.bold,),),
                      ],
                    ),

                  ],
              ),

            ),
          ),
        ),

      );

  }

}