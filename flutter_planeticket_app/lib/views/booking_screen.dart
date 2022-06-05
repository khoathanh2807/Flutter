import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

import './select_flight_time_screen.dart';

class BookingScreen extends StatefulWidget {

  @override
  State<BookingScreen> createState() => _BookingScreenState();

}

class _BookingScreenState extends State<BookingScreen> with TickerProviderStateMixin {

  late TabController _tabController;
  int selectedIndex = 0;

  final departureDateFormController = TextEditingController();
  final arrivalDateFormController = TextEditingController();
  final passengerFormController = TextEditingController();

  DateTime selectedDepartureDate = DateTime.now();
  DateTime selectedArrivalDate = DateTime.now();

  int adultPassenger = 1;
  int childPassenger = 0;
  int infantPassenger = 0;
  String passengerAmount = '1 Người lớn';

  String selectedSeatClass = 'Economy';
  List<String> seatClassList = ['Economy', 'Business'];

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
          title: Text('Đặt vé', style: TextStyle(fontWeight: FontWeight.w600,),),
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

        tabs: const [
          Text('Khứ hồi',),
          Text('Một chiều',),
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

              departureArrivalLocation('Điểm đi','SGN', 'Ho Chi Minh City'),

              IconButton(
                icon: const Icon(Icons.swap_horiz_outlined),
                onPressed: (){
                  Fluttertoast.showToast(msg: 'Coming Soon');
                  // showModalBottomSheet(
                  //     context: context,
                  //     builder: (context){
                  //       return  Container(height: 100, child: const Text('Hello'),);
                  //     }
                  // );
                },
              ),

              departureArrivalLocation('Điểm đến','HAN', 'Hanoi'),

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
              submitButton(),
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

              departureArrivalLocation('Điểm đi','SGN', 'Ho Chi Minh City'),

              IconButton(
                icon: const Icon(Icons.swap_horiz_outlined),
                onPressed: (){
                  Fluttertoast.showToast(msg: 'Coming Soon');
                  // showModalBottomSheet(
                  //     context: context,
                  //     builder: (context){
                  //       return  Container(height: 100, child: const Text('Hello'),);
                  //     }
                  // );
                },
              ),

              departureArrivalLocation('Điểm đến','DAD', 'Da Nang'),

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
                child: arrivalDatePicker(),
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
              submitButton(),
              SizedBox(width: 5,),
            ],
          ),

        ],
      ),

    );

  }

  Widget departureArrivalLocation(String locationType, String locationSymbol, String locationName) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [

        Text(locationType, style: const TextStyle(fontSize: 12,),),
        const SizedBox(height: 13,),

        InkWell(

          child: Column(
            children: [

              Text(locationSymbol, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20,),),
              SizedBox(height: 5,),

              Text(locationName, style: const TextStyle(fontSize: 11,),),
              SizedBox(height: 8,),

              CircleAvatar(
                radius: 8,
                backgroundColor: Colors.grey[300],
                child: Icon(Icons.edit, color: Colors.black, size: 8,),
              ),

            ],
          ),

          onTap: (){
            Fluttertoast.showToast(msg: 'Coming Soon');
          },

        ),

      ],
    );
  }

  Widget departureDatePicker() {

    departureDateFormController.text = DateFormat('dd.MM.yyyy').format(selectedDepartureDate).toString();

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text('Ngày đi', style: TextStyle(fontSize: 13, color: Colors.grey,),),

        Container(
          height: 44,
          child: TextFormField(
              controller: departureDateFormController,
              readOnly: true,
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
              }
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
      firstDate: DateTime(1999),
      lastDate: DateTime(2099),
      // initialEntryMode: DatePickerEntryMode.input,
      // initialDatePickerMode: DatePickerMode.year,
      helpText: 'Chọn ngày bay đi', // Title of DatePicker
      cancelText: 'Cancel',
      confirmText: 'OK',
      errorFormatText: 'You enter invalid format date',
      errorInvalidText: 'You enter out of range date value',
      fieldLabelText: 'Enter Start Date',   // Title of iput text field
      fieldHintText: 'Month/Day/Year',
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
                minimumYear: 2000,
                maximumYear: 2025,
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

  Widget arrivalDatePicker() {

    arrivalDateFormController.text = DateFormat('dd.MM.yyyy').format(selectedArrivalDate).toString();

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text('Ngày về', style: TextStyle(fontSize: 13, color: Colors.grey,),),

        Container(
          height: 44,
          child: TextFormField(
              controller: arrivalDateFormController,
              readOnly: true,
              style: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold,),
              decoration: const InputDecoration(
                suffixIcon: Icon(Icons.arrow_drop_down, color: Colors.black,),
                // border: UnderlineInputBorder(
                //     borderSide: BorderSide(color: Colors.grey,),
                // ),
              ),

              onTap: () {
                _selectArrivalDate(context);
              }
          ),

        ),

      ],
    );

  }

  // DatePicker type depend on platform
  _selectArrivalDate(BuildContext context) async {

    var platform = Theme.of(context).platform;
    assert(platform != null);

    if (platform == TargetPlatform.iOS) {
      return buildCupertinoArrivalDatePicker(context);
    } else {
      return buildMaterialArrivalDatePicker(context);
    }

  }

  // This builds Material DatePicker for Android
  buildMaterialArrivalDatePicker(BuildContext context) async {

    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedArrivalDate,
      firstDate: DateTime(1999),
      lastDate: DateTime(2099),
      // initialEntryMode: DatePickerEntryMode.input,
      // initialDatePickerMode: DatePickerMode.year,
      helpText: 'Chọn ngày bay về', // Title of DatePicker
      cancelText: 'Cancel',
      confirmText: 'OK',
      errorFormatText: 'You enter invalid format date',
      errorInvalidText: 'You enter out of range date value',
      fieldLabelText: 'Enter Start Date',   // Title of iput text field
      fieldHintText: 'Month/Day/Year',
    );

    if (pickedDate != null && pickedDate != selectedArrivalDate) {
      setState(() {
        selectedArrivalDate = pickedDate;
      });
    }

  }

  // This builds Cupertino DatePicker for iOS
  buildCupertinoArrivalDatePicker(BuildContext context) {

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
                initialDateTime: selectedArrivalDate,
                minimumYear: 2000,
                maximumYear: 2025,
                mode: CupertinoDatePickerMode.date,
                // use24hFormat: true,
                onDateTimeChanged: (pickedDate) {
                  if (pickedDate != null && pickedDate != selectedArrivalDate) {
                    setState(() {
                      selectedArrivalDate = pickedDate;
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

  Widget pasengerPicker(){

    passengerFormController.text = passengerAmount;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text('Hành khách', style: TextStyle(fontSize: 13, color: Colors.grey,),),

        Container(
          height: 44,
          child: TextFormField(
            controller: passengerFormController,
            readOnly: true,
            style: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold,),
            decoration: const InputDecoration(
              suffixIcon: Icon(Icons.arrow_drop_down, color: Colors.black,),
              // border: UnderlineInputBorder(
              //     borderSide: BorderSide(color: Colors.grey,),
              // ),
            ),

            onTap: (){
              showModalBottomSheet(context: context, builder: (context) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    Container(

                      width: double.maxFinite,
                      padding: EdgeInsets.symmetric(vertical: 20,),

                      decoration: BoxDecoration(
                        color: Colors.blueGrey.withOpacity(0.1),
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20),),
                      ),

                      child: const Text('Hành khách', style: TextStyle(fontWeight: FontWeight.bold,), textAlign: TextAlign.center,),

                    ),
                    SizedBox(height: 20,),

                    Row(
                      children: [
                        SizedBox(width: 30,),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('Người lớn', style: TextStyle(fontWeight: FontWeight.bold,),),
                              SizedBox(height: 8,),
                              Text('Từ 12 tuổi', style: TextStyle(color: Colors.grey),)
                            ],
                          ),
                        ),
                        Row(
                          children: [

                            Container(
                              width: 35,
                              height: 30,
                              child: IconButton(
                                icon: const Icon(Icons.remove, size: 14,),
                                onPressed: adultPassenger == 1 ? null : (){
                                  adultPassenger = adultPassenger - 1;
                                  setState(() {
                                  });
                                },
                              ),
                              decoration: BoxDecoration(
                                color: Colors.blueGrey.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            SizedBox(width: 15,),

                            Text(adultPassenger.toString(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15,),),
                            SizedBox(width: 15,),

                            Container(
                              width: 35,
                              height: 30,
                              child: IconButton(
                                icon: const Icon(Icons.add, size: 16,),
                                onPressed: (){
                                  adultPassenger = adultPassenger + 1;
                                  setState(() {
                                  });
                                },
                              ),
                              decoration: BoxDecoration(
                                color: Colors.blueGrey.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(5),
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
                            children: const[
                              Text('Trẻ em', style: TextStyle(fontWeight: FontWeight.bold,),),
                              SizedBox(height: 8,),
                              Text('Từ 2 đến 11 tuổi', style: TextStyle(color: Colors.grey))
                            ],
                          ),
                        ),
                        Row(
                          children: [

                            Container(
                              width: 35,
                              height: 30,
                              child: IconButton(
                                icon: const Icon(Icons.remove, size: 14,),
                                onPressed: childPassenger == 0 ? null : (){
                                  childPassenger = childPassenger - 1;
                                  setState(() {
                                  });
                                },
                              ),
                              decoration: BoxDecoration(
                                color: Colors.blueGrey.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            SizedBox(width: 15,),

                            Text(childPassenger.toString(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15,),),
                            SizedBox(width: 15,),

                            Container(
                              width: 35,
                              height: 30,
                              child: IconButton(
                                icon: const Icon(Icons.add, size: 16,),
                                onPressed: (){
                                  childPassenger = childPassenger + 1;
                                  setState(() {
                                  });
                                },
                              ),
                              decoration: BoxDecoration(
                                color: Colors.blueGrey.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(5),
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
                            children: const [
                              Text('Em bé', style: TextStyle(fontWeight: FontWeight.bold,),),
                              SizedBox(height: 8,),
                              Text('Dưới 2 tuổi', style: TextStyle(color: Colors.grey),),
                            ],
                          ),
                        ),
                        Row(
                          children: [

                            Container(
                              width: 35,
                              height: 30,
                              child: IconButton(
                                icon: const Icon(Icons.remove, size: 14,),
                                onPressed: infantPassenger == 0 ? null : (){
                                  infantPassenger = infantPassenger - 1;
                                  setState(() {
                                  });
                                },
                              ),
                              decoration: BoxDecoration(
                                color: Colors.blueGrey.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            SizedBox(width: 15,),

                            Text(infantPassenger.toString(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15,),),
                            SizedBox(width: 15,),

                            Container(
                              width: 35,
                              height: 30,
                              child: IconButton(
                                icon: const Icon(Icons.add, size: 16,),
                                onPressed: (){
                                  infantPassenger = infantPassenger + 1;
                                  setState(() {
                                  });
                                },
                              ),
                              decoration: BoxDecoration(
                                color: Colors.blueGrey.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(5),
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

        Text('Hạng ghế', style: TextStyle(fontSize: 13, color: Colors.grey,),),

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
        decoration: const InputDecoration(
          hintText: 'Mã giảm giá',
          hintStyle: TextStyle(fontSize: 13, color: Colors.grey,),
        ),
      ),
    );
  }

  Widget submitButton() {
    return ElevatedButton(
      child: Text('Tìm chuyến bay', style: TextStyle(fontWeight: FontWeight.bold,),),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 14, bottom: 14,),
      ),
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => SelectFlightTimeScreen(),),);
      },
    );
  }

}