import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import './payment_screen.dart';

class SelectFlightTimeScreen extends StatefulWidget{

  @override
  State<SelectFlightTimeScreen> createState() => _SelectFlightTimeScreenState();

}

class _SelectFlightTimeScreenState extends State<SelectFlightTimeScreen> with TickerProviderStateMixin {

  late TabController _tabController;
  int selectedIndex = 0;

  String departurePlace = 'SGN';
  String arrivalPlace = 'HAN';

  String departureTime = '05:35';
  String arrivalTime = '08:05';
  String flightTimeAmount = '2h30p';

  String economyTicketPrice = '1,990,000 VND';
  String businessTicketPrice = '5,600,000 VND';

  String economyRemainingSeats = 'Còn 15 ghế';
  String businessRemainingSeats = 'Còn 3 ghế';

  @override
  void initState() {
    _tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: selectedIndex,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.grey[200],

        appBar: AppBar(
          // elevation: 0,
          centerTitle: true,
          title: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text('Chuyến đi SGN - HAN', style: TextStyle(fontWeight: FontWeight.w600,),),
              SizedBox(height: 5,),
              Text('1 Người lớn', style: TextStyle(fontSize: 12,),)
            ],
          ),
        ),

        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 35, horizontal: 15,),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                selectSeatClassButton(),
                SizedBox(height: 20,),

                Text('* Giá trên một hành khách và chưa bao gồm thuế, phi', style: TextStyle(fontSize: 11, color: Colors.black87,),),
                SizedBox(height: 20,),

                selectSeatClassTicketList(),

              ],
          ),
        ),

    );

  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget selectSeatClassButton(){

    return Container(

      margin: EdgeInsets.symmetric(horizontal: 27,),

      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12),),
      ),

      child: TabBar(

        controller: _tabController,

        tabs: const [
          Text('ECONOMY',),
          Text('BUSINESS',),
        ],

        indicator: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(12),),
          boxShadow: const [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 3,
              offset: Offset(5, 5),
            ),
          ],
        ),

        labelPadding: EdgeInsets.only(top: 18, bottom: 18,),
        labelStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.bold,),
        unselectedLabelColor: Theme.of(context).primaryColor,

        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },

      ),

    );

  }

  Widget selectSeatClassTicketList() {

    return IndexedStack(
      index: selectedIndex,
      children: [
        economyTicketList(),
        businessTicketList(),
      ],
    );

  }

  Widget economyTicketList() {

    return ListView.builder(

        physics: const NeverScrollableScrollPhysics(),
        primary: false,
        shrinkWrap: true,

        itemCount: 20,
        itemBuilder: (context, index) {

            return Container(

                    margin: EdgeInsets.symmetric(vertical: 7,),
                    padding: EdgeInsets.symmetric(vertical: 22, horizontal: 17,),

                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(12),),
                        border: Border.all(width: 1, color: Colors.grey, style: BorderStyle.solid,),
                    ),

                    child: InkWell(

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                            
                          Expanded(
                            child: Row(
                              children: [

                                Column(
                                  children: [
                                    Text(departureTime, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,),),
                                    SizedBox(height: 10,),
                                    Text(departurePlace),
                                  ],
                                ),
                                SizedBox(width: 20,),

                                Column(
                                  children: [
                                    Text(flightTimeAmount, style: TextStyle(fontSize: 12,),),
                                    SizedBox(height: 6,),
                                    Icon(FontAwesomeIcons.plane, size: 15,),   // color: Theme.of(context).primaryColor,
                                  ],
                                ),
                                SizedBox(width: 20,),

                                Column(
                                  children: [
                                    Text(arrivalTime, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,),),
                                    SizedBox(height: 10,),
                                    Text(arrivalPlace),
                                  ],
                                ),

                              ],
                            ),
                          ),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('Giá từ', style: TextStyle(fontSize: 12,),),
                              SizedBox(height: 6, ),
                              Text(economyTicketPrice, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor,),),
                              SizedBox(height: 6, ),
                              Text(economyRemainingSeats, style: TextStyle(fontSize: 12, color: Colors.black54,),),
                            ],
                          ),
                          
                        ],
                      ),

                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (_) => PaymentScreen(),),);
                      },

                    ),
              
            );

        },

    );

  }

  Widget businessTicketList() {

    return ListView.builder(

      physics: const NeverScrollableScrollPhysics(),
      primary: false,
      shrinkWrap: true,

      itemCount: 20,
      itemBuilder: (context, index) {

        return Container(

          margin: EdgeInsets.symmetric(vertical: 7,),
          padding: EdgeInsets.symmetric(vertical: 22, horizontal: 17,),

          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(12),),
            border: Border.all(width: 1, color: Colors.grey, style: BorderStyle.solid,),
          ),

          child: InkWell(

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Expanded(
                  child: Row(
                    children: [

                      Column(
                        children: [
                          Text(departureTime, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,),),
                          SizedBox(height: 10,),
                          Text(departurePlace),
                        ],
                      ),
                      SizedBox(width: 20,),

                      Column(
                        children: [
                          Text(flightTimeAmount, style: TextStyle(fontSize: 12,),),
                          SizedBox(height: 6,),
                          Icon(FontAwesomeIcons.plane, size: 15,),   // color: Theme.of(context).primaryColor,
                        ],
                      ),
                      SizedBox(width: 20,),

                      Column(
                        children: [
                          Text(arrivalTime, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,),),
                          SizedBox(height: 10,),
                          Text(arrivalPlace),
                        ],
                      ),

                    ],
                  ),
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('Giá từ', style: TextStyle(fontSize: 12,),),
                    SizedBox(height: 6, ),
                    Text(businessTicketPrice, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor,),),
                    SizedBox(height: 6, ),
                    Text(businessRemainingSeats, style: TextStyle(fontSize: 12, color: Colors.black54,),),
                  ],
                ),

              ],
            ),

            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (_) => PaymentScreen(),),);
            },

          ),

        );

      },

    );

  }

}