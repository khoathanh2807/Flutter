import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../ticket/ticket_detail_screen.dart';

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
                children: const [
                  Text('Loading...', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600,),),
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
                children: const [
                  SizedBox(height: 85,),
                  Icon(Icons.airplane_ticket_outlined, size: 35,),
                  SizedBox(height: 15,),
                  Text('Bạn chưa đặt vé máy bay nào!', style: TextStyle(fontWeight: FontWeight.w600,),),
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

                        Text('Ngày: ' + ticketList[index]['departureDate']),
                        SizedBox(height: 3,),

                        Text('Vào lúc: ' + ticketList[index]['departureTime']),
                        SizedBox(height: 3,),

                        Text('Hạng ghế: ' + ticketList[index]['seatClass']),
                        SizedBox(height: 6,),

                        if(ticketList[index]['amount'] == 1)
                          Text(ticketList[index]['ticketType'], style: TextStyle(fontWeight: FontWeight.w500,),),
                        if(ticketList[index]['amount'] != 1)
                          Text(ticketList[index]['ticketType'] + ' x ' + ticketList[index]['amount'].toString(), style: TextStyle(fontWeight: FontWeight.w500,),),

                      ],
                    ),

                    onTap: () {

                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => TicketDetailScreen(ticketID: ticketList[index]['ticketID']),),);

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

}