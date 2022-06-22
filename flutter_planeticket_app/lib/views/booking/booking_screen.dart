import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import './select_flight_time_screen.dart';

class BookingScreen extends StatefulWidget {

  @override
  State<BookingScreen> createState() => _BookingScreenState();

}

class _BookingScreenState extends State<BookingScreen> with TickerProviderStateMixin {

  late TabController _tabController;
  int selectedIndex = 0;

  String departureLocationSymbol = '';
  String departureLocationName = '';

  String arrivalLocationSymbol = '';
  String arrivalLocationName = '';

  DateTime selectedDepartureDate = DateTime.now();
  DateTime selectedReturnDate = DateTime.now();

  int adultPassenger = 1;
  int childPassenger = 0;
  int infantPassenger = 0;
  String passengerAmount = '';

  List<String> seatClassList = ['Economy', 'Business',];
  String selectedSeatClass = 'Economy';

  final departureDateController = TextEditingController();
  final returnDateController = TextEditingController();
  final passengerController = TextEditingController();

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

        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey[200],

        appBar: AppBar(
          // elevation: 0,
          centerTitle: true,
          title: Text('BookingTicket'.tr, style: TextStyle(fontWeight: FontWeight.w600,),),
        ),

        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 25, horizontal: 15,),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                    ticketBookingTabBar(_tabController),
                    SizedBox(height: 25,),

                    ticketBookingTab(_tabController),

                ],
            ),
          ),
        ),

    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget ticketBookingTabBar(TabController _tabController) {

    return Container(

      height: 37,

      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(18)),
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 3,
            offset: Offset(5, 5),
            // blurStyle: BlurStyle.inner,
            // spreadRadius: 1,
          ),
        ],
      ),

      child: TabBar(

        controller: _tabController,

        tabs: [
          Text('RoundTrip'.tr,),
          Text('OneWay'.tr,),
        ],

        indicator: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(18),
          // boxShadow: [
          //   BoxShadow(
          //       color: Colors.black,
          //       blurRadius: 5,
          //       offset: Offset(0, 1),
          //   ),
          // ],
        ),

        // labelPadding: EdgeInsets.only(top: 10, bottom: 10),
        labelStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.bold,),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w500,),
        unselectedLabelColor: Theme.of(context).primaryColor,

        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },

      ),

    );

  }

  Widget ticketBookingTab(TabController _tabController) {

    return IndexedStack(
      index: selectedIndex,
      children: [
          roundTripTab(),
          oneWayTripTab(),
      ],
    );

  }

  Widget oneWayTripTab() {

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

      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              departureLocation(),

              IconButton(

                icon: const Icon(Icons.swap_horiz_outlined, size: 28,),

                onPressed: (departureLocationName == arrivalLocationName) ? null : () {

                  setState(() {

                    String tempLocationName = departureLocationName;
                    String tempLocationSymbol = departureLocationSymbol;

                    departureLocationName = arrivalLocationName;
                    departureLocationSymbol = arrivalLocationSymbol;

                    arrivalLocationName = tempLocationName;
                    arrivalLocationSymbol = tempLocationSymbol;

                  });

                },

              ),

              arrivalLocation(),

            ],
          ),
          const SizedBox(height: 20,),

          departureDatePicker(),
          const SizedBox(height: 20,),

          pasengerPicker(),
          const SizedBox(height: 20,),

          seatClassPicker(),
          const SizedBox(height: 20,),

          Row(
            children: [
              Expanded(
                child: promotionCode(),
              ),
              SizedBox(width: 40,),
              oneWayTripSubmitButton(),
              SizedBox(width: 5,),
            ],
          ),

        ],
      ),

    );

  }

  Widget roundTripTab() {

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
          ]
      ),

      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              departureLocation(),

              IconButton(

                icon: const Icon(Icons.swap_horiz_outlined, size: 28,),

                onPressed: (departureLocationName == arrivalLocationName) ? null : () {

                  setState(() {

                    String tempLocationName = departureLocationName;
                    String tempLocationSymbol = departureLocationSymbol;

                    departureLocationName = arrivalLocationName;
                    departureLocationSymbol = arrivalLocationSymbol;

                    arrivalLocationName = tempLocationName;
                    arrivalLocationSymbol = tempLocationSymbol;

                  });

                },

              ),

              arrivalLocation(),

            ],
          ),
          const SizedBox(height: 20,),

          Row(
            children: [
              Expanded(
                  child: departureDatePicker(),
              ),
              SizedBox(width: 20,),
              Expanded(
                child: returnDatePicker(),
              ),
            ],
          ),
          const SizedBox(height: 20,),

          pasengerPicker(),
          const SizedBox(height: 20,),

          seatClassPicker(),
          const SizedBox(height: 20,),

          Row(
            children: [
              Expanded(
                child: promotionCode(),
              ),
              SizedBox(width: 40,),
              roundTripSubmitButton(),
              SizedBox(width: 5,),
            ],
          ),

        ],
      ),

    );

  }

  Widget departureLocation() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [

        Text('DepartureLocation'.tr, style: const TextStyle(fontSize: 12,),),
        const SizedBox(height: 13,),

        InkWell(

          child: SizedBox(
            height: 66,
            width: MediaQuery.of(context).size.width*0.25,
            child: departureLocationName == '' ? addDeprtureArrivalLocation() : Column(
              children: [

                Text(departureLocationSymbol, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Theme.of(context).primaryColor,),),
                SizedBox(height: 5,),

                Text(departureLocationName, style: const TextStyle(fontSize: 11,),),
                SizedBox(height: 8,),

                CircleAvatar(
                  radius: 8,
                  backgroundColor: Colors.grey[300],
                  child: Icon(Icons.edit, color: Colors.black, size: 8,),
                ),

              ],
            ),
          ),

          onTap: () {

            showModalBottomSheet(
                context: context,
                builder: (context) {

                  return StreamBuilder(

                    stream: FirebaseFirestore.instance.collection('locations').snapshots(),
                    builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {

                      if(snapshot.connectionState == ConnectionState.waiting){
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      final locationList = snapshot.data.docs;

                      if (locationList.isEmpty) {
                        return Center(
                          child: Text('EmptyLocationList'.tr,),
                        );
                      } else {
                        return ListView.separated(

                          padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 35,),

                          shrinkWrap: true,

                          itemCount: locationList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile (
                              title: Text(locationList[index]['name'], style: TextStyle(fontWeight: FontWeight.bold,),),
                              subtitle: Text(locationList[index]['airport']),
                              trailing: Text(locationList[index]['symbol']),
                              onTap: () {
                                setState(() {
                                  departureLocationSymbol = locationList[index]['symbol'];
                                  departureLocationName = locationList[index]['name'];
                                });
                                Navigator.of(context).pop();
                              },
                            );
                          },

                          separatorBuilder: (BuildContext context, int index) => const Divider(
                            height: 0,
                            color: Colors.grey,
                            thickness: 0.1,
                          ),

                        );
                      }

                    },

                  );

                }
            );

          },

        ),

      ],
    );
  }

  Widget arrivalLocation() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [

        Text('ArrivalLocation'.tr, style: const TextStyle(fontSize: 12,),),
        const SizedBox(height: 13,),

        InkWell(

          child: SizedBox(
            height: 66,
            width: MediaQuery.of(context).size.width*0.25,
            child: arrivalLocationName == '' ? addDeprtureArrivalLocation() : Column(
              children: [

                Text(arrivalLocationSymbol, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Theme.of(context).primaryColor,),),
                SizedBox(height: 5,),

                Text(arrivalLocationName, style: const TextStyle(fontSize: 11,),),
                SizedBox(height: 8,),

                CircleAvatar(
                  radius: 8,
                  backgroundColor: Colors.grey[300],
                  child: Icon(Icons.edit, color: Colors.black, size: 8,),
                ),

              ],
            ),
          ),

          onTap: (){

            showModalBottomSheet(
                context: context,
                builder: (context) {

                  return StreamBuilder(

                    stream: FirebaseFirestore.instance.collection('locations').snapshots(),
                    builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {

                      if(snapshot.connectionState == ConnectionState.waiting){
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      final locationList = snapshot.data.docs;

                      if (locationList.isEmpty) {
                        return Center(
                          child: Text('EmptyLocationList'.tr,),
                        );
                      } else {
                        return ListView.separated(

                          padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 35,),

                          shrinkWrap: true,

                          itemCount: locationList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile (
                              title: Text(locationList[index]['name'], style: TextStyle(fontWeight: FontWeight.bold,),),
                              subtitle: Text(locationList[index]['airport']),
                              trailing: Text(locationList[index]['symbol']),
                              onTap: () {
                                setState(() {
                                  arrivalLocationSymbol = locationList[index]['symbol'];
                                  arrivalLocationName = locationList[index]['name'];
                                });
                                Navigator.of(context).pop();
                              },
                            );
                          },

                          separatorBuilder: (BuildContext context, int index) => const Divider(
                            height: 0,
                            color: Colors.grey,
                            thickness: 0.1,
                          ),

                        );
                      }

                    },

                  );

                }
            );

          },

        ),

      ],
    );
  }

  Widget addDeprtureArrivalLocation() {

    return Center(
      child: Container(
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black38,
                  blurRadius: 3,
                  offset: Offset(5, 5),
                ),
              ],
          ),
          child: CircleAvatar(
                radius: 15,
                backgroundColor: Theme.of(context).primaryColor,
                child: Icon(Icons.add, color: Colors.white, size: 17,),
          ),
      ),
    );

  }

  Widget departureDatePicker() {

    departureDateController.text = DateFormat('dd.MM.yyyy').format(selectedDepartureDate).toString();

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text('DepartureDate'.tr, style: TextStyle(fontSize: 13, color: Colors.grey,),),

        Container(
          height: 44,
          child: TextFormField(

              readOnly: true,

              controller: departureDateController,

              style: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold,),

              decoration: const InputDecoration(
                // contentPadding: EdgeInsets.only(left: 5,),
                suffixIcon: Icon(Icons.arrow_drop_down, color: Colors.black,),
                // border: UnderlineInputBorder(
                //     borderSide: BorderSide(color: Colors.grey,),
                // ),
              ),

              onTap: (){
                _selectDepartureDate(context);
              },

          ),

        ),

      ],
    );

  }

  // DatePicker type depend on platform
  _selectDepartureDate(BuildContext context) async {

    var platform = Theme.of(context).platform;
    assert(platform != null);

    if (platform == TargetPlatform.iOS) {
      return buildCupertinoDepartureDatePicker(context);
    } else {
      return buildMaterialDepartureDatePicker(context);
    }

  }

  // This builds Material DatePicker for Android
  buildMaterialDepartureDatePicker(BuildContext context) async {

    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDepartureDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      // initialEntryMode: DatePickerEntryMode.input,
      // initialDatePickerMode: DatePickerMode.year,
      helpText: 'DepartureDateFieldHint'.tr, // Title of DatePicker
      cancelText: 'Cancel'.tr,
      confirmText: 'OK',
      errorFormatText: 'DateFieldValidate'.tr,
      errorInvalidText: 'DateFieldValidate'.tr,
      fieldLabelText: 'DepartureDateFieldHint'.tr,   // Title of input text field
      fieldHintText: 'Month/Day/Year (MM/dd/yyyy)',
    );

    if (pickedDate != null && pickedDate != selectedDepartureDate) {
      setState(() {
        selectedDepartureDate = pickedDate;
      });
    }

  }

  // This builds Cupertino DatePicker for iOS
  buildCupertinoDepartureDatePicker(BuildContext context) {

    showModalBottomSheet(
        context: context,
        builder: (BuildContext builder) {
          return Container(

            height: MediaQuery.of(context).copyWith().size.height / 3,

            child: CupertinoTheme(

              data: const CupertinoThemeData(
                brightness: Brightness.light,
              ),

              child: CupertinoDatePicker(
                initialDateTime: selectedDepartureDate,
                minimumYear: 1900,
                maximumYear: 2100,
                mode: CupertinoDatePickerMode.date,
                // use24hFormat: true,
                onDateTimeChanged: (pickedDate) {
                  if (pickedDate != null && pickedDate != selectedDepartureDate) {
                    setState(() {
                      selectedDepartureDate = pickedDate;
                    });
                  }
                },
                backgroundColor: CupertinoColors.lightBackgroundGray,
              ),

            ),

          );
        }
    );

  }

  Widget returnDatePicker() {

    returnDateController.text = DateFormat('dd.MM.yyyy').format(selectedReturnDate).toString();

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text('ReturnDate'.tr, style: TextStyle(fontSize: 13, color: Colors.grey,),),

        Container(
          height: 44,
          child: TextFormField(

              readOnly: true,

              controller: returnDateController,

              style: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold,),

              decoration: const InputDecoration(
                suffixIcon: Icon(Icons.arrow_drop_down, color: Colors.black,),
                // border: UnderlineInputBorder(
                //     borderSide: BorderSide(color: Colors.grey,),
                // ),
              ),

              onTap: () {
                _selectReturnDate(context);
              },

          ),

        ),

      ],
    );

  }

  // DatePicker type depend on platform
  _selectReturnDate(BuildContext context) async {

    var platform = Theme.of(context).platform;
    assert(platform != null);

    if (platform == TargetPlatform.iOS) {
      return buildCupertinoReturnDatePicker(context);
    } else {
      return buildMaterialReturnDatePicker(context);
    }

  }

  // This builds Material DatePicker for Android
  buildMaterialReturnDatePicker(BuildContext context) async {

    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedReturnDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      // initialEntryMode: DatePickerEntryMode.input,
      // initialDatePickerMode: DatePickerMode.year,
      helpText: 'ReturnDateFieldHint'.tr, // Title of DatePicker
      cancelText: 'Cancel'.tr,
      confirmText: 'OK',
      errorFormatText: 'DateFieldValidate'.tr,
      errorInvalidText: 'DateFieldValidate'.tr,
      fieldLabelText: 'ReturnDateFieldHint'.tr,   // Title of input text field
      fieldHintText: 'Month/Day/Year (MM/dd/yyyy)',
    );

    if (pickedDate != null && pickedDate != selectedReturnDate) {
      setState(() {
        selectedReturnDate = pickedDate;
      });
    }

  }

  // This builds Cupertino DatePicker for iOS
  buildCupertinoReturnDatePicker(BuildContext context) {

    showModalBottomSheet(
        context: context,
        builder: (BuildContext builder) {
          return Container(

            height: MediaQuery.of(context).copyWith().size.height / 3,

            child: CupertinoTheme(

              data: const CupertinoThemeData(
                brightness: Brightness.light,
              ),

              child: CupertinoDatePicker(
                initialDateTime: selectedReturnDate,
                minimumYear: 1900,
                maximumYear: 2100,
                mode: CupertinoDatePickerMode.date,
                // use24hFormat: true,
                onDateTimeChanged: (pickedDate) {
                  if (pickedDate != null && pickedDate != selectedReturnDate) {
                    setState(() {
                      selectedReturnDate = pickedDate;
                    });
                  }
                },
                backgroundColor: CupertinoColors.lightBackgroundGray,
              ),

            ),

          );
        }
    );

  }

  Widget pasengerPicker() {

    String adultAmount = '$adultPassenger ' + 'Adult'.tr;
    String childAmount = '$childPassenger ' + 'Child'.tr;
    String infantAmount = '$infantPassenger ' + 'Infant'.tr;

    if (childPassenger == 0 && infantPassenger == 0) {
      passengerAmount = adultAmount;
    } else if (infantPassenger == 0) {
      passengerAmount = adultAmount + ', ' + childAmount;
    } else if (childPassenger == 0) {
      passengerAmount = adultAmount + ', ' + infantAmount;
    } else {
      passengerAmount = adultAmount + ', ' + childAmount + ', ' + infantAmount;
    }

    passengerController.text = passengerAmount;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text('Passenger'.tr, style: TextStyle(fontSize: 13, color: Colors.grey,),),

        Container(
          height: 44,
          child: TextFormField(

            readOnly: true,

            controller: passengerController,

            style: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold,),

            decoration: const InputDecoration(
              suffixIcon: Icon(Icons.arrow_drop_down, color: Colors.black,),
              // border: UnderlineInputBorder(
              //     borderSide: BorderSide(color: Colors.grey,),
              // ),
            ),

            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return StatefulBuilder(
                      builder: (BuildContext context, StateSetter setBottomSheetState) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [

                            Container(

                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.symmetric(vertical: 20,),

                              decoration: BoxDecoration(
                                color: Colors.blueGrey.withOpacity(0.1),
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20),),
                              ),

                              child: Text('Passenger'.tr, style: TextStyle(fontWeight: FontWeight.bold,), textAlign: TextAlign.center,),

                            ),
                            SizedBox(height: 20,),

                            Row(
                              children: [
                                SizedBox(width: 30,),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Adult'.tr, style: TextStyle(fontWeight: FontWeight.bold,),),
                                      SizedBox(height: 8,),
                                      Text('AdultAge'.tr, style: TextStyle(color: Colors.grey),)
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [

                                    Container(
                                      width: 35,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color: Colors.blueGrey.withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: IconButton(
                                        icon: const Icon(Icons.remove, size: 14,),
                                        onPressed: adultPassenger == 1 ? null : () {

                                          adultPassenger = adultPassenger - 1;
                                          setBottomSheetState(() {
                                          });
                                          setState(() {
                                          });

                                        },
                                      ),
                                    ),
                                    SizedBox(width: 15,),

                                    SizedBox(
                                        width: 25,
                                        child: Text(adultPassenger.toString(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15,), textAlign: TextAlign.center,),
                                    ),
                                    SizedBox(width: 15,),

                                    Container(
                                      width: 35,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color: Colors.blueGrey.withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: IconButton(
                                        icon: const Icon(Icons.add, size: 16,),
                                        onPressed: (adultPassenger + childPassenger + infantPassenger >= 9) ? null : () {

                                          adultPassenger = adultPassenger + 1;
                                          setBottomSheetState(() {
                                          });
                                          setState(() {
                                          });

                                        },
                                      ),
                                    ),

                                  ],
                                ),
                                SizedBox(width: 30,),
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
                              children: [
                                SizedBox(width: 30,),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Child'.tr, style: TextStyle(fontWeight: FontWeight.bold,),),
                                      SizedBox(height: 8,),
                                      Text('ChildAge'.tr, style: TextStyle(color: Colors.grey))
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [

                                    Container(
                                      width: 35,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color: Colors.blueGrey.withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: IconButton(
                                        icon: const Icon(Icons.remove, size: 14,),
                                        onPressed: childPassenger == 0 ? null : () {

                                          childPassenger = childPassenger - 1;
                                          setBottomSheetState(() {
                                          });
                                          setState(() {
                                          });

                                        },
                                      ),
                                    ),
                                    SizedBox(width: 15,),

                                    SizedBox(
                                      width: 25,
                                      child: Text(childPassenger.toString(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15,), textAlign: TextAlign.center,),
                                    ),
                                    SizedBox(width: 15,),

                                    Container(
                                      width: 35,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color: Colors.blueGrey.withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: IconButton(
                                        icon: const Icon(Icons.add, size: 16,),
                                        onPressed: (adultPassenger + childPassenger + infantPassenger >= 9 || childPassenger + infantPassenger >= adultPassenger / 2) ? null : () {

                                          childPassenger = childPassenger + 1;
                                          setBottomSheetState(() {
                                          });
                                          setState(() {
                                          });

                                        },
                                      ),
                                    ),

                                  ],
                                ),
                                SizedBox(width: 30,),
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
                              children: [
                                SizedBox(width: 30,),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Infant'.tr, style: TextStyle(fontWeight: FontWeight.bold,),),
                                      SizedBox(height: 8,),
                                      Text('InfantAge'.tr, style: TextStyle(color: Colors.grey),),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [

                                    Container(
                                      width: 35,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color: Colors.blueGrey.withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: IconButton(
                                        icon: const Icon(Icons.remove, size: 14,),
                                        onPressed: infantPassenger == 0 ? null : () {

                                          infantPassenger = infantPassenger - 1;
                                          setBottomSheetState(() {
                                          });
                                          setState(() {
                                          });

                                        },
                                      ),
                                    ),
                                    SizedBox(width: 15,),

                                    SizedBox(
                                      width: 25,
                                      child: Text(infantPassenger.toString(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15,), textAlign: TextAlign.center,),
                                    ),
                                    SizedBox(width: 15,),

                                    Container(
                                      width: 35,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color: Colors.blueGrey.withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: IconButton(
                                        icon: const Icon(Icons.add, size: 16,),
                                        onPressed: (adultPassenger + childPassenger + infantPassenger >= 9 || infantPassenger + childPassenger >= adultPassenger / 2) ? null : () {

                                          infantPassenger = infantPassenger + 1;
                                          setBottomSheetState(() {
                                          });
                                          setState(() {
                                          });

                                        },
                                      ),
                                    ),

                                  ],
                                ),
                                SizedBox(width: 30,),
                              ],
                            ),
                            SizedBox(height: 15,),
                            const Divider(
                              height: 0,
                              color: Colors.grey,
                              thickness: 0.1,
                            ),
                            SizedBox(height: 50,),

                          ],
                        );
                      }
                    );
              });
            },

          ),
        ),

      ],
    );

  }

  Widget seatClassPicker() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text('SeatClass'.tr, style: TextStyle(fontSize: 13, color: Colors.grey,),),

        Container(
          height: 44,
          child: DropdownButtonFormField(

            // elevation: 30,
            // alignment: Alignment.center,
            // isExpanded: true,
            decoration: const InputDecoration(
              suffixIcon: Icon(Icons.arrow_drop_down, color: Colors.black,),
              // border: UnderlineInputBorder(
              //     borderSide: BorderSide(color: Colors.grey,),
              // ),
            ),
            icon: Visibility(visible: false, child: Icon(Icons.arrow_downward),),
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black,),
            borderRadius: BorderRadius.circular(12),
            dropdownColor: Colors.grey[200],

            value: selectedSeatClass,

            items: seatClassList.map((item) {
              return DropdownMenuItem(
                value: item,
                child: Text(item),
              );
            }).toList(),

            onChanged: (value){
              setState(() {
                selectedSeatClass = value as String;
              });
            },

          ),
        ),

      ],
    );
  }

  Widget promotionCode() {
    return Container(
      height: 44,
      child: TextFormField(
        decoration: InputDecoration(
          hintText: 'PromotionCode'.tr,
          hintStyle: TextStyle(fontSize: 13, color: Colors.grey,),
        ),
      ),
    );
  }

  Widget oneWayTripSubmitButton() {
    return ElevatedButton(
      child: Text('SearchFlight'.tr, style: TextStyle(fontWeight: FontWeight.bold,),),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 14, bottom: 14,),
      ),
      onPressed: (departureLocationName == arrivalLocationName || departureLocationName == '' || arrivalLocationName == '') ? null : () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => SelectFlightTimeScreen(
          departureLocationName: departureLocationName,
          arrivalLocationName: arrivalLocationName,
          departureLocationSymbol: departureLocationSymbol,
          arrivalLocationSymbol: arrivalLocationSymbol,
          departureDate: DateFormat('dd.MM.yyyy').format(selectedDepartureDate).toString(),
          returnDate: null,
          adultPassenger: adultPassenger,
          childPassenger: childPassenger,
          infantPassenger: infantPassenger,
          seatClass: selectedSeatClass,
        ),),);
      },
    );
  }

  Widget roundTripSubmitButton() {
    return ElevatedButton(
      child: Text('SearchFlight'.tr, style: TextStyle(fontWeight: FontWeight.bold,),),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 14, bottom: 14,),
      ),
      onPressed: (departureLocationName == arrivalLocationName || departureLocationName == '' || arrivalLocationName == '') ? null : () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => SelectFlightTimeScreen(
          departureLocationName: departureLocationName,
          arrivalLocationName: arrivalLocationName,
          departureLocationSymbol: departureLocationSymbol,
          arrivalLocationSymbol: arrivalLocationSymbol,
          departureDate: DateFormat('dd.MM.yyyy').format(selectedDepartureDate).toString(),
          returnDate: DateFormat('dd.MM.yyyy').format(selectedReturnDate).toString(),
          adultPassenger: adultPassenger,
          childPassenger: childPassenger,
          infantPassenger: infantPassenger,
          seatClass: selectedSeatClass,
        ),),);
      },
    );
  }

}