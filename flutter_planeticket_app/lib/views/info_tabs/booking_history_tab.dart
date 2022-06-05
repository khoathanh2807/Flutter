import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BookingHistoryTab extends StatelessWidget{

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

      child: ListView.builder(

                physics: const NeverScrollableScrollPhysics(),
                primary: false,
                shrinkWrap: true,

                itemCount: 10,
                itemBuilder: (context, index) {

                  return Container(

                      margin: EdgeInsets.symmetric(vertical: 7,),
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30,),

                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.all(Radius.circular(18),),
                        border: Border.all(width: 1, color: Colors.grey, style: BorderStyle.solid,),
                      ),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [

                          Text('Ho Chi Minh City - Hanoi', style: TextStyle(fontWeight: FontWeight.bold,),),
                          SizedBox(height: 6,),

                          Text('Ngày: 01/07/2022'),
                          SizedBox(height: 3,),

                          Text('Vào lúc: 05:35'),
                          SizedBox(height: 3,),

                          Text('Hạng ghế: Economy'),
                          SizedBox(height: 6,),

                          Text('Vé người lớn', style: TextStyle(fontWeight: FontWeight.w500,),),

                        ],
                      ),
                  );

                },

      ),

    );

  }

}