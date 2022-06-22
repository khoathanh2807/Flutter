import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../ticket/ticket_details_screen.dart';

class BookingHistoryTab extends StatelessWidget{

  final currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {

    return Container(

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

      child: StreamBuilder<Object>(
        stream: FirebaseFirestore.instance.collection('users').doc(currentUser!.uid).collection('tickets').orderBy('departureDate', descending: true).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Loading'.tr, style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600,),),
                  SizedBox(height: 45),
                  CircularProgressIndicator(),
                ],
              ),
            );
          }

          final ticketList = snapshot.data.docs;

          if (ticketList.isEmpty){
            return Center(
              child: Column(
                children: [
                  SizedBox(height: 85,),
                  Icon(Icons.airplane_ticket_outlined, size: 35,),
                  SizedBox(height: 15,),
                  Text('EmptyHistory'.tr, style: TextStyle(fontWeight: FontWeight.w600,),),
                  SizedBox(height: 85,)
                ],
              ),
            );
          } else {
            return ListView.builder(

              shrinkWrap: true,
              primary: false,
              physics: const NeverScrollableScrollPhysics(),

              itemCount: ticketList.length,
              itemBuilder: (context, index) {
                return Container(

                  margin: EdgeInsets.symmetric(vertical: 7,),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30,),

                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.all(Radius.circular(18),),
                    border: Border.all(
                      width: 1, color: Colors.grey, style: BorderStyle.solid,),
                  ),

                  child: InkWell(

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text('${ticketList[index]['departureLocationName']} - ${ticketList[index]['arrivalLocationName']}', style: TextStyle(fontWeight: FontWeight.bold,),),
                        SizedBox(height: 6,),

                        // Text('DepartureDate'.tr + ticketList[index]['departureDate']),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'DepartureDate'.tr + ': ',
                                style: TextStyle(color: Colors.black,),
                              ),
                              TextSpan(
                                text: ticketList[index]['departureDate'],
                                style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black,),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 3,),

                        // Text('DepartureTime'.tr + ticketList[index]['departureTime']),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'DepartureTime'.tr + ': ',
                                style: TextStyle(color: Colors.black,),
                              ),
                              TextSpan(
                                text: ticketList[index]['departureTime'],
                                style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black,),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 3,),

                        // Text('SeatClass'.tr + ticketList[index]['seatClass']),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'SeatClass'.tr + ': ',
                                style: TextStyle(color: Colors.black,),
                              ),
                              TextSpan(
                                text: ticketList[index]['seatClass'],
                                style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black,),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 6,),

                        if (Get.locale == const Locale('Vietnamese') && ticketList[index]['amount'] == 1)
                          Text(ticketTypeVietnamese(ticketList[index]['ticketType'].toString()), style: TextStyle(fontWeight: FontWeight.w500,),),
                        if (Get.locale == const Locale('Vietnamese') && ticketList[index]['amount'] != 1)
                          Text(ticketTypeVietnamese(ticketList[index]['ticketType'].toString()) + ' x ' + ticketList[index]['amount'].toString(), style: TextStyle(fontWeight: FontWeight.w500,),),

                        if (Get.locale == const Locale('English') && ticketList[index]['amount'] == 1)
                          Text(ticketList[index]['ticketType'], style: TextStyle(fontWeight: FontWeight.w500,),),
                        if (Get.locale == const Locale('English') && ticketList[index]['amount'] != 1)
                          Text(ticketList[index]['ticketType'] + ' x ' + ticketList[index]['amount'].toString(), style: TextStyle(fontWeight: FontWeight.w500,),),

                      ],
                    ),

                    onTap: () {

                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => TicketDetailsScreen(ticketID: ticketList[index]['ticketID']),),);

                    },

                  ),
                );
              },

            );
          }

        }
      ),

    );

  }

  String ticketTypeVietnamese(String inputTicketType) {

    if (inputTicketType == 'Adult ticket') {
      inputTicketType = 'Vé người lớn';
    } else if (inputTicketType == 'Child ticket') {
      inputTicketType = 'Vé trẻ em';
    } else {
      inputTicketType = 'Vé em bé';
    }

    return inputTicketType;

  }

}