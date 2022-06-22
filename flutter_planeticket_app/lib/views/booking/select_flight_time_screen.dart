import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../platform_alert.dart';
import './payment_screen.dart';
import './select_flight_time_round_trip_screen.dart';

class SelectFlightTimeScreen extends StatefulWidget{

  SelectFlightTimeScreen({
    required this.departureLocationName,
    required this.arrivalLocationName,
    required this.departureLocationSymbol,
    required this.arrivalLocationSymbol,
    required this.departureDate,
    this.returnDate,
    required this.adultPassenger,
    required this.childPassenger,
    required this.infantPassenger,
    required this.seatClass,
  });

  final String departureLocationName;
  final String arrivalLocationName;

  final String departureLocationSymbol;
  final String arrivalLocationSymbol;

  final String departureDate;
  String? returnDate;

  final int adultPassenger;
  final int childPassenger;
  final int infantPassenger;

  final String seatClass;

  @override
  State<SelectFlightTimeScreen> createState() => _SelectFlightTimeScreenState();

}

class _SelectFlightTimeScreenState extends State<SelectFlightTimeScreen> with TickerProviderStateMixin {

  late TabController _tabController;
  int selectedIndex = 0;

  // String departureTime = '05:35';
  // String arrivalTime = '08:05';
  // String flightTimeDuration = '2h30p';

  // int economyTicketPrice = ... ;
  // int businessTicketPrice = ... ;
  // String economyRemainingSeats = 'Còn 15 ghế';
  // String businessRemainingSeats = 'Còn 3 ghế';

  String passengerAmount = '';

  @override
  void initState() {

    if (widget.seatClass == 'Business') {
      selectedIndex = 1;
    }

    _tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: selectedIndex,
    );

    print(widget.departureLocationName);
    print(widget.arrivalLocationName);
    print(widget.departureLocationSymbol);
    print(widget.arrivalLocationSymbol);
    print(widget.departureDate);
    print(widget.returnDate);
    print(widget.adultPassenger);
    print(widget.childPassenger);
    print(widget.infantPassenger);

    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    String adultAmount = '${widget.adultPassenger} ' + 'Adult'.tr;
    String childAmount = '${widget.childPassenger} ' + 'Child'.tr;
    String infantAmount = '${widget.infantPassenger} ' + 'Infant'.tr;

    if (widget.childPassenger == 0 && widget.infantPassenger == 0) {
      passengerAmount = adultAmount;
    } else if (widget.infantPassenger == 0) {
      passengerAmount = adultAmount + ', ' + childAmount;
    } else if (widget.childPassenger == 0) {
      passengerAmount = adultAmount + ', ' + infantAmount;
    } else {
      passengerAmount = adultAmount + ', ' + childAmount + ', ' + infantAmount;
    }

    return Scaffold(

        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.grey[200],

        appBar: AppBar(
          // elevation: 0,
          centerTitle: true,
          title: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('DepartureFlight'.tr + ' ${widget.departureLocationSymbol} - ${widget.arrivalLocationSymbol}', style: TextStyle(fontWeight: FontWeight.w600,),),
              SizedBox(height: 5,),
              Text(passengerAmount, style: TextStyle(fontSize: 12,),)
            ],
          ),
        ),

        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 35, horizontal: 15,),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.black, width: 1.5,),
                      ),
                    ),
                    child: Text('Date'.tr + ' ${widget.departureDate}', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18, color: Colors.black,),),
                ),
                SizedBox(height: 30,),

                selectSeatClassButton(),
                SizedBox(height: 20,),

                Text('* ' + 'TicketPriceNote'.tr, style: TextStyle(fontSize: 11, color: Colors.black87,),),
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

    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('flights').where('departureLocationSymbol', isEqualTo: widget.departureLocationSymbol).where('arrivalLocationSymbol', isEqualTo: widget.arrivalLocationSymbol).where('departureDate', isEqualTo: widget.departureDate).snapshots(),
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

        final flightList = snapshot.data.docs;

        if (flightList.isEmpty){
            return Container(
              padding: EdgeInsets.symmetric(vertical: 50,),
              alignment: Alignment.center,
              child: Text('EmptyFlightList'.tr, style: TextStyle(fontWeight: FontWeight.w600,), textAlign: TextAlign.center,),
            );
        } else {
            return ListView.builder (

              shrinkWrap: true,
              primary: false,
              physics: const NeverScrollableScrollPhysics(),

              itemCount: flightList.length,
              itemBuilder: (context, index) {

                // economyTicketPrice = (
                //         widget.adultPassenger * (flightList[index]['economyTicketPrice'])
                //       + widget.childPassenger * (flightList[index]['economyTicketPrice'])
                //       + widget.infantPassenger * (flightList[index]['economyTicketPrice'])
                // ).toString();
                // print('economyTicketPrice = $economyTicketPrice');

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
                                  Text(flightList[index]['departureTime'], style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,),),
                                  SizedBox(height: 10,),
                                  Text(widget.departureLocationSymbol),
                                ],
                              ),
                              SizedBox(width: 20,),

                              Column(
                                children: [
                                  Text(flightList[index]['flightTimeDuration'], style: TextStyle(fontSize: 12,),),
                                  SizedBox(height: 6,),
                                  Icon(FontAwesomeIcons.plane, size: 15,),
                                  // color: Theme.of(context).primaryColor,
                                ],
                              ),
                              SizedBox(width: 20,),

                              Column(
                                children: [
                                  Text(flightList[index]['arrivalTime'], style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,),),
                                  SizedBox(height: 10,),
                                  Text(widget.arrivalLocationSymbol),
                                ],
                              ),

                            ],
                          ),
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('PriceFrom'.tr, style: TextStyle(fontSize: 12,),),
                            SizedBox(height: 6,),
                            Text(NumberFormat.decimalPattern().format(flightList[index]['economyTicketPrice']) + ' VND', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor,),),   // NumberFormat.currency(locale: 'vi', symbol: 'VND').format(123456) ==> 123.456 VND
                            SizedBox(height: 6,),
                            flightList[index]['economyRemainingSeats'] == 0
                                ? Text('SoldOut'.tr, style: TextStyle(fontSize: 12, color: Colors.red,),)
                                : Text('RemainSeats'.trParams({'seatAmount': flightList[index]['economyRemainingSeats'].toString()}), style: TextStyle(fontSize: 12, color: Colors.black54,),),
                          ],
                        ),

                      ],
                    ),

                    onTap: flightList[index]['economyRemainingSeats'] <= 0 ? null : () {

                        if (widget.adultPassenger + widget.childPassenger + widget.infantPassenger > flightList[index]['economyRemainingSeats']) {
                          var warningAlert = PlatformAlert(
                            title: 'NotEnoughSeats'.tr,
                            message: 'NotEnoughSeatsMessage'.tr,
                          );
                          warningAlert.showWarningAlert(context);
                        } else {
                          if (widget.returnDate == null) {
                              Navigator.of(context).push(MaterialPageRoute(builder: (_) => PaymentScreen(
                                  departureLocationName: widget.departureLocationName,
                                  arrivalLocationName: widget.arrivalLocationName,
                                  departureLocationSymbol: widget.departureLocationSymbol,
                                  arrivalLocationSymbol: widget.arrivalLocationSymbol,
                                  departureDate: widget.departureDate,
                                  arrivalDate: flightList[index]['arrivalDate'],
                                  returnDate: null,
                                  adultPassenger: widget.adultPassenger,
                                  childPassenger: widget.childPassenger,
                                  infantPassenger: widget.infantPassenger,
                                  departureTime: flightList[index]['departureTime'],
                                  arrivalTime: flightList[index]['arrivalTime'],
                                  flightTimeDuration: flightList[index]['flightTimeDuration'],
                                  seatClass: 'Economy',
                                  ticketPrice: flightList[index]['economyTicketPrice'],
                                  remainingSeats: flightList[index]['economyRemainingSeats'],
                                  flightID: flightList[index]['id'],
                              ),),);
                          } else {
                              Navigator.of(context).push(MaterialPageRoute(builder: (_) => SelectFlightTimeRoundTripScreen(
                                  departureLocationName: widget.arrivalLocationName,    // đổi vị trí đi đến thành vị trí xuất phát lúc đi về
                                  arrivalLocationName: widget.departureLocationName,
                                  departureLocationSymbol: widget.arrivalLocationSymbol,
                                  arrivalLocationSymbol: widget.departureLocationSymbol,
                                  departureDate: widget.departureDate,
                                  arrivalDate: flightList[index]['arrivalDate'],
                                  returnDate: widget.returnDate as String,
                                  adultPassenger: widget.adultPassenger,
                                  childPassenger: widget.childPassenger,
                                  infantPassenger: widget.infantPassenger,
                                  departureTime: flightList[index]['departureTime'],
                                  arrivalTime: flightList[index]['arrivalTime'],
                                  flightTimeDuration: flightList[index]['flightTimeDuration'],
                                  seatClass: 'Economy',
                                  ticketPrice: flightList[index]['economyTicketPrice'],
                                  remainingSeats: flightList[index]['economyRemainingSeats'],
                                  flightID: flightList[index]['id'],
                              ),),);
                          }
                        }

                    },

                  ),

                );

              },

            );
        }

      }
    );

  }

  Widget businessTicketList() {

    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('flights').where('departureLocationSymbol', isEqualTo: widget.departureLocationSymbol).where('arrivalLocationSymbol', isEqualTo: widget.arrivalLocationSymbol).where('departureDate', isEqualTo: widget.departureDate).snapshots(),
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

        final flightList = snapshot.data.docs;

        if (flightList.isEmpty){
            return Container(
              padding: EdgeInsets.symmetric(vertical: 50,),
              alignment: Alignment.center,
              child: Text('EmptyFlightList'.tr, style: TextStyle(fontWeight: FontWeight.w600,), textAlign: TextAlign.center,),
            );
        } else {
            return ListView.builder(

              shrinkWrap: true,
              primary: false,
              physics: const NeverScrollableScrollPhysics(),

              itemCount: flightList.length,
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
                                  Text(flightList[index]['departureTime'], style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,),),
                                  SizedBox(height: 10,),
                                  Text(widget.departureLocationSymbol),
                                ],
                              ),
                              SizedBox(width: 20,),

                              Column(
                                children: [
                                  Text(flightList[index]['flightTimeDuration'], style: TextStyle(fontSize: 12,),),
                                  SizedBox(height: 6,),
                                  Icon(FontAwesomeIcons.plane, size: 15,),   // color: Theme.of(context).primaryColor,
                                ],
                              ),
                              SizedBox(width: 20,),

                              Column(
                                children: [
                                  Text(flightList[index]['arrivalTime'], style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,),),
                                  SizedBox(height: 10,),
                                  Text(widget.arrivalLocationSymbol),
                                ],
                              ),

                            ],
                          ),
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('PriceFrom'.tr, style: TextStyle(fontSize: 12,),),
                            SizedBox(height: 6, ),
                            Text(NumberFormat.decimalPattern().format(flightList[index]['businessTicketPrice']) + ' VND', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor,),),   // NumberFormat.currency(locale: 'vi', symbol: 'VND').format(123456) ==> 123.456 VND
                            SizedBox(height: 6,),
                            flightList[index]['businessRemainingSeats'] == 0
                                ? Text('SoldOut'.tr, style: TextStyle(fontSize: 12, color: Colors.red,),)
                                : Text('RemainSeats'.trParams({'seatAmount': flightList[index]['businessRemainingSeats'].toString()}), style: TextStyle(fontSize: 12, color: Colors.black54,),),

                          ],
                        ),

                      ],
                    ),

                    onTap: flightList[index]['businessRemainingSeats'] <= 0 ? null : () {

                        if (widget.adultPassenger + widget.childPassenger + widget.infantPassenger > flightList[index]['businessRemainingSeats']) {
                          var warningAlert = PlatformAlert(
                            title: 'NotEnoughSeats'.tr,
                            message: 'NotEnoughSeatsMessage'.tr,
                          );
                          warningAlert.showWarningAlert(context);
                        } else {
                          if (widget.returnDate == null) {
                            Navigator.of(context).push(MaterialPageRoute(builder: (_) => PaymentScreen(
                                departureLocationName: widget.departureLocationName,
                                arrivalLocationName: widget.arrivalLocationName,
                                departureLocationSymbol: widget.departureLocationSymbol,
                                arrivalLocationSymbol: widget.arrivalLocationSymbol,
                                departureDate: widget.departureDate,
                                arrivalDate: flightList[index]['arrivalDate'],
                                returnDate: null,
                                adultPassenger: widget.adultPassenger,
                                childPassenger: widget.childPassenger,
                                infantPassenger: widget.infantPassenger,
                                departureTime: flightList[index]['departureTime'],
                                arrivalTime: flightList[index]['arrivalTime'],
                                flightTimeDuration: flightList[index]['flightTimeDuration'],
                                seatClass: 'Business',
                                ticketPrice: flightList[index]['businessTicketPrice'],
                                remainingSeats: flightList[index]['businessRemainingSeats'],
                                flightID: flightList[index]['id'],
                            ),),);
                          } else {
                            Navigator.of(context).push(MaterialPageRoute(builder: (_) => SelectFlightTimeRoundTripScreen(
                                departureLocationName: widget.arrivalLocationName,
                                arrivalLocationName: widget.departureLocationName,
                                departureLocationSymbol: widget.arrivalLocationSymbol,
                                arrivalLocationSymbol: widget.departureLocationSymbol,
                                departureDate: widget.departureDate,
                                arrivalDate: flightList[index]['arrivalDate'],
                                returnDate: widget.returnDate as String,
                                adultPassenger: widget.adultPassenger,
                                childPassenger: widget.childPassenger,
                                infantPassenger: widget.infantPassenger,
                                departureTime: flightList[index]['departureTime'],
                                arrivalTime: flightList[index]['arrivalTime'],
                                flightTimeDuration: flightList[index]['flightTimeDuration'],
                                seatClass: 'Business',
                                ticketPrice: flightList[index]['businessTicketPrice'],
                                remainingSeats: flightList[index]['businessRemainingSeats'],
                                flightID: flightList[index]['id'],
                            ),),);
                          }
                        }

                    },

                  ),

                );

              },

            );
        }

      }
    );

  }

}