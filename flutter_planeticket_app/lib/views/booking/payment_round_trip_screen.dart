import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../controllers/user_credentials/user_credentials.dart';
import '../../controllers/ticket/ticket_controller.dart';
import '../../models/user.dart';
import '../../models/gender.dart';
import '../app.dart';

class PaymentRoundTripScreen extends StatefulWidget {

  PaymentRoundTripScreen({
    required this.departureLocationName,
    required this.arrivalLocationName,
    required this.departureLocationSymbol,
    required this.arrivalLocationSymbol,
    required this.departureDate,
    required this.arrivalDate,
    required this.returnDate,
    required this.adultPassenger,
    required this.childPassenger,
    required this.infantPassenger,
    required this.departureTime,
    required this.arrivalTime,
    required this.flightTimeDuration,
    required this.seatClass,
    required this.ticketPrice,
    required this.remainingSeats,
    required this.flightID,

    required this.returnArrivalDate,
    required this.returnDepartureTime,
    required this.returnArrivalTime,
    required this.returnFlightTimeDuration,
    required this.returnSeatClass,
    required this.returnTicketPrice,
    required this.returnRemainingSeats,
    required this.returnFlightID,
  });

  final String departureLocationName;
  final String arrivalLocationName;

  final String departureLocationSymbol;
  final String arrivalLocationSymbol;

  final String departureDate;
  final String arrivalDate;
  final String returnDate;

  final int adultPassenger;
  final int childPassenger;
  final int infantPassenger;

  final String departureTime;
  final String arrivalTime;
  final String flightTimeDuration;

  final String seatClass;
  final int ticketPrice;

  final int remainingSeats;
  final String flightID;

  final String returnArrivalDate;
  final String returnDepartureTime;
  final String returnArrivalTime;
  final String returnFlightTimeDuration;
  final String returnSeatClass;
  final int returnTicketPrice;
  final int returnRemainingSeats;
  final String returnFlightID;

  @override
  State<PaymentRoundTripScreen> createState() => _PaymentRoundTripScreenState();

}

class _PaymentRoundTripScreenState extends State<PaymentRoundTripScreen> {

  FirebaseUser firebaseUser = UserCredentials().getCredentials();

  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();

  bool termsAgreement = false;

  String passengerAmount = '';

  @override
  void initState() {

    UserCredentials().getName().then((value) => firebaseUser.displayName = value!).whenComplete(() {
      setState(() {
      });
    });

    UserCredentials().getGender().then((value) => firebaseUser.gender = value!).whenComplete(() {
      setState(() {
      });
    });

    UserCredentials().getPhoneNumber().then((value) => firebaseUser.phoneNumber = value!).whenComplete(() {
      setState(() {
      });
    });

    print(widget.departureLocationName);
    print(widget.arrivalLocationName);
    print(widget.departureLocationSymbol);
    print(widget.arrivalLocationSymbol);
    print(widget.departureDate);
    print(widget.arrivalDate);
    print(widget.returnDate);
    print(widget.adultPassenger);
    print(widget.childPassenger);
    print(widget.infantPassenger);
    print(widget.departureTime);
    print(widget.arrivalTime);
    print(widget.flightTimeDuration);
    print(widget.seatClass);
    print(widget.ticketPrice);
    print(widget.remainingSeats);
    print(widget.flightID);

    print(widget.returnArrivalDate);
    print(widget.returnDepartureTime);
    print(widget.returnArrivalTime);
    print(widget.returnFlightTimeDuration);
    print(widget.returnSeatClass);
    print(widget.returnTicketPrice);
    print(widget.returnRemainingSeats);
    print(widget.returnFlightID);

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
    print('passengerAmount = $passengerAmount');

    // 1 - chuyến bay đi
    String adultTicketPrice = NumberFormat.decimalPattern().format(widget.ticketPrice*widget.adultPassenger);
    String childTicketPrice = NumberFormat.decimalPattern().format(widget.ticketPrice*widget.childPassenger*0.75);
    String infantTicketPrice = NumberFormat.decimalPattern().format(widget.ticketPrice*widget.infantPassenger*0.5);

    // 2 - chuyến bay về
    String returnAdultTicketPrice = NumberFormat.decimalPattern().format(widget.returnTicketPrice*widget.adultPassenger);
    String returnChildTicketPrice = NumberFormat.decimalPattern().format(widget.returnTicketPrice*widget.childPassenger*0.75);
    String returnInfantTicketPrice = NumberFormat.decimalPattern().format(widget.returnTicketPrice*widget.infantPassenger*0.5);

    // VAT và tổng giá
    String VAT = NumberFormat.decimalPattern().format((widget.ticketPrice + widget.returnTicketPrice)*(widget.adultPassenger + widget.childPassenger*0.75 + widget.infantPassenger*0.5)/10);
    String totalPrice = NumberFormat.decimalPattern().format(
              widget.ticketPrice*widget.adultPassenger
            + widget.ticketPrice*widget.childPassenger*0.75
            + widget.ticketPrice*widget.infantPassenger*0.5
            + widget.returnTicketPrice*widget.adultPassenger
            + widget.returnTicketPrice*widget.childPassenger*0.75
            + widget.returnTicketPrice*widget.childPassenger*0.5
            + (widget.ticketPrice + widget.returnTicketPrice)*(widget.adultPassenger + widget.childPassenger*0.75 + widget.infantPassenger*0.5)/10
    );

    print('adultTicketPrice = $adultTicketPrice');
    print('childTicketPrice = $childTicketPrice');
    print('infantTicketPrice = $infantTicketPrice');
    print('returnAdultTicketPrice = $returnAdultTicketPrice');
    print('returnChildTicketPrice = $returnChildTicketPrice');
    print('returnInfantTicketPrice = $returnInfantTicketPrice');
    print('VAT = $VAT');
    print('totalPrice = $totalPrice');

    return  Scaffold(

      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[200],

      appBar: AppBar(
        // elevation: 0,
        centerTitle: true,
        title: Text('Payment'.tr, style: TextStyle(fontWeight: FontWeight.w600,),),
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 15,),
        child: Column(
          children: [

            Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15,),
              decoration: const BoxDecoration(
                color: Colors.white,
                // shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(12)),
                // border: Border.all(width: 1, color: Theme.of(context).primaryColor, style: BorderStyle.solid,),
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

                  Text('DepartureFlightInformation'.tr, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,),),
                  SizedBox(height: 15,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text('DepartureLocation'.tr, style: TextStyle(fontStyle: FontStyle.italic,),),
                            SizedBox(height: 12,),
                            Text(widget.departureTime, style: TextStyle(fontWeight: FontWeight.bold,),),
                            SizedBox(height: 5,),
                            Text(widget.departureDate,),
                            SizedBox(height: 8,),
                            Text(widget.departureLocationSymbol, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Theme.of(context).primaryColor,),),
                            SizedBox(height: 8,),
                            Text(widget.departureLocationName, style: TextStyle(fontWeight: FontWeight.bold,),),
                          ],
                        ),
                      ),
                      SizedBox(width: 20,),
                      Column(
                        children: [
                          Text(widget.flightTimeDuration, style: TextStyle(fontSize: 13,),),
                          SizedBox(height: 6,),
                          Icon(FontAwesomeIcons.plane, size: 20,),   // color: Theme.of(context).primaryColor,
                        ],
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                        child: Column(
                          children: [
                            Text('ArrivalLocation'.tr, style: TextStyle(fontStyle: FontStyle.italic,),),
                            SizedBox(height: 12,),
                            Text(widget.arrivalTime, style: TextStyle(fontWeight: FontWeight.bold,),),
                            SizedBox(height: 5,),
                            Text(widget.arrivalDate,),
                            SizedBox(height: 8,),
                            Text(widget.arrivalLocationSymbol, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Theme.of(context).primaryColor,),),
                            SizedBox(height: 8,),
                            Text(widget.arrivalLocationName, style: TextStyle(fontWeight: FontWeight.bold,),),
                          ],
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),
            SizedBox(height: 20,),

            Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15,),
              decoration: const BoxDecoration(
                color: Colors.white,
                // shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(12)),
                // border: Border.all(width: 1, color: Theme.of(context).primaryColor, style: BorderStyle.solid,),
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

                  Text('ReturnFlightInformation'.tr, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,),),
                  SizedBox(height: 15,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text('DepartureLocation'.tr, style: TextStyle(fontStyle: FontStyle.italic,),),
                            SizedBox(height: 12,),
                            Text(widget.returnDepartureTime, style: TextStyle(fontWeight: FontWeight.bold,),),
                            SizedBox(height: 5,),
                            Text(widget.returnDate,),
                            SizedBox(height: 8,),
                            Text(widget.arrivalLocationSymbol, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Theme.of(context).primaryColor,),),
                            SizedBox(height: 8,),
                            Text(widget.arrivalLocationName, style: TextStyle(fontWeight: FontWeight.bold,),),
                          ],
                        ),
                      ),
                      SizedBox(width: 20,),
                      Column(
                        children: [
                          Text(widget.returnFlightTimeDuration, style: TextStyle(fontSize: 13,),),
                          SizedBox(height: 6,),
                          Icon(FontAwesomeIcons.plane, size: 20,),   // color: Theme.of(context).primaryColor,
                        ],
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                        child: Column(
                          children: [
                            Text('ArrivalLocation'.tr, style: TextStyle(fontStyle: FontStyle.italic,),),
                            SizedBox(height: 12,),
                            Text(widget.returnArrivalTime, style: TextStyle(fontWeight: FontWeight.bold,),),
                            SizedBox(height: 5,),
                            Text(widget.returnArrivalDate,),
                            SizedBox(height: 8,),
                            Text(widget.departureLocationSymbol, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Theme.of(context).primaryColor,),),
                            SizedBox(height: 8,),
                            Text(widget.departureLocationName, style: TextStyle(fontWeight: FontWeight.bold,),),
                          ],
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),
            SizedBox(height: 20,),

            Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15,),
              decoration: const BoxDecoration(
                color: Colors.white,
                // shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(12)),
                // border: Border.all(width: 1, color: Theme.of(context).primaryColor, style: BorderStyle.solid,),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black38,
                    blurRadius: 3,
                    offset: Offset(5, 5),
                  )
                ],
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text('PassengerInformation'.tr, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,),),
                    SizedBox(height: 15,),

                    genderField(),
                    SizedBox(height: 20,),

                    nameField(),
                    SizedBox(height: 20,),

                    emailField(),
                    SizedBox(height: 20,),

                    phoneNumberField(),

                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),

            Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15,),
              decoration: const BoxDecoration(
                color: Colors.white,
                // shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(12)),
                // border: Border.all(width: 1, color: Theme.of(context).primaryColor, style: BorderStyle.solid,),
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

                  Text('PriceDetails'.tr, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,),),
                  SizedBox(height: 13,),

                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: const [
                  //     Text('Ho Chi Minh City',),
                  //     Icon(FontAwesomeIcons.plane, color: Colors.black, size: 16,),
                  //     Text('Hanoi',),
                  //   ],
                  // ),

                  const Divider(
                    height: 0,
                    color: Colors.grey,
                    thickness: 0.1,
                  ),
                  SizedBox(height: 13,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('PassengerAmount'.tr, style: TextStyle(fontWeight: FontWeight.w500,),),
                      Text(passengerAmount, style: TextStyle(fontWeight: FontWeight.w500,),),
                    ],
                  ),
                  SizedBox(height: 13,),

                  const Divider(
                    height: 0,
                    color: Colors.grey,
                    thickness: 0.1,
                  ),
                  SizedBox(height: 13,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('DepartureFlight2'.tr, style: TextStyle(fontWeight: FontWeight.w500, decoration: TextDecoration.underline,),),
                      Text('TicketClass'.trParams({'seatClass': widget.seatClass}), style: TextStyle(fontWeight: FontWeight.w500,),),

                    ],
                  ),
                  SizedBox(height: 13,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('AdultTicketPrice'.tr + ' (x ${widget.adultPassenger})',),
                      Text(adultTicketPrice + ' VND', style: TextStyle(fontWeight: FontWeight.bold,),),
                    ],
                  ),
                  SizedBox(height: 13,),

                  if (widget.childPassenger > 0)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('ChildTicketPrice'.tr + ' (x ${widget.childPassenger})',),
                        Text(childTicketPrice + ' VND', style: TextStyle(fontWeight: FontWeight.bold,),),
                      ],
                    ),
                  if (widget.childPassenger > 0)
                    SizedBox(height: 13,),

                  if (widget.infantPassenger > 0)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('InfantTicketPrice'.tr + ' (x ${widget.infantPassenger})',),
                        Text(infantTicketPrice + ' VND', style: TextStyle(fontWeight: FontWeight.bold,),),
                      ],
                    ),
                  if (widget.infantPassenger > 0)
                    SizedBox(height: 13,),

                  const Divider(
                    height: 0,
                    color: Colors.grey,
                    thickness: 0.1,
                  ),
                  SizedBox(height: 13,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('ReturnFlight2'.tr, style: TextStyle(fontWeight: FontWeight.w500, decoration: TextDecoration.underline,),),
                      Text('TicketClass'.trParams({'seatClass': widget.returnSeatClass}), style: TextStyle(fontWeight: FontWeight.w500,),),
                    ],
                  ),
                  SizedBox(height: 13,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('AdultTicketPrice'.tr + ' (x ${widget.adultPassenger})',),
                      Text(returnAdultTicketPrice + ' VND', style: TextStyle(fontWeight: FontWeight.bold,),),
                    ],
                  ),
                  SizedBox(height: 13,),

                  if (widget.childPassenger > 0)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('ChildTicketPrice'.tr + ' (x ${widget.childPassenger})',),
                        Text(returnChildTicketPrice + ' VND', style: TextStyle(fontWeight: FontWeight.bold,),),
                      ],
                    ),
                  if (widget.childPassenger > 0)
                    SizedBox(height: 13,),

                  if (widget.infantPassenger > 0)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('InfantTicketPrice'.tr + ' (x ${widget.infantPassenger})',),
                        Text(returnInfantTicketPrice + ' VND', style: TextStyle(fontWeight: FontWeight.bold,),),
                      ],
                    ),
                  if (widget.infantPassenger > 0)
                    SizedBox(height: 13,),

                  const Divider(
                    height: 0,
                    color: Colors.grey,
                    thickness: 0.1,
                  ),
                  SizedBox(height: 13,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('VAT', style: TextStyle(fontWeight: FontWeight.w500,),),
                      Text(VAT + ' VND', style: TextStyle(fontWeight: FontWeight.bold,),),
                    ],
                  ),
                  SizedBox(height: 13,),

                  const Divider(
                    height: 0,
                    color: Colors.grey,
                    thickness: 0.1,
                  ),
                  SizedBox(height: 13,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('TotalPrice'.tr, style: TextStyle(fontWeight: FontWeight.bold,),),
                      Text(totalPrice + ' VND', style: TextStyle(fontWeight: FontWeight.bold,),),
                    ],
                  ),

                ],
              ),
            ),
            SizedBox(height: 20,),

            Container(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10,),
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
              child: CheckboxListTile(

                title: Text('TermsConditionsBooking'.tr, style: TextStyle(fontSize: 14,),),

                contentPadding: EdgeInsets.zero,
                activeColor: Theme.of(context).colorScheme.primary,
                controlAffinity: ListTileControlAffinity.leading,
                visualDensity: VisualDensity(horizontal: -4,),

                value: termsAgreement,

                onChanged: (newValue) {
                  FocusScope.of(context).unfocus();
                  setState(() {
                    termsAgreement = newValue!;
                  });
                },

              ),
            ),
            SizedBox(height: 20,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  child: Text('Cancel'.tr, style: TextStyle(color: Theme.of(context).primaryColor,),),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white,),
                    padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 13, horizontal: MediaQuery.of(context).size.width*0.16,),),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(color: Theme.of(context).primaryColor, width: 0.5, style: BorderStyle.solid,),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                ElevatedButton(
                  child: Text('Confirm'.tr, style: TextStyle(fontWeight: FontWeight.bold,),),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 13, horizontal: MediaQuery.of(context).size.width*0.15,),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8),),
                  ),
                  onPressed: !termsAgreement ? null : () {
                    FocusScope.of(context).unfocus();
                    if(_formKey.currentState!.validate()) {
                      showPaymentAlert('PaymentTitle'.tr, 'PaymentMessage'.tr);
                    }
                  },
                ),
              ],
            ),
            SizedBox(height: 25,),

          ],
        ),
      ),

    );

  }

  Widget genderField() {

    List<Gender> genderList = [
      Gender(genderName: 'Female'.tr, genderID: 'F',),
      Gender(genderName: 'Male'.tr, genderID: 'M',),
    ];

    return  DropdownButtonFormField(

      decoration: InputDecoration(
        prefixIcon: Icon(Icons.wc),
        labelText: 'Gender'.tr,
        hintText: 'GenderFieldHint'.tr,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0),),
        contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 8,),
      ),
      borderRadius: BorderRadius.circular(12),
      dropdownColor: Colors.grey[200],

      value: firebaseUser.gender,

      items: genderList.map((Gender gender) {
        return DropdownMenuItem<String>(
          child: Text(genderList.singleWhere((x) => x.genderID == gender.genderID).genderName),
          value: gender.genderID,
        );
      }).toList(),

      validator: (value) {
        if (value == '' || value == null) {
          return 'EmptyFieldValidate'.tr;
        }
        return null;
      },

      onChanged: (value) {
        setState(() {
          firebaseUser.gender = value as String;
        });
      },

    );

  }

  Widget nameField() {

    nameController.text = firebaseUser.displayName!;

    return TextFormField(

      controller: nameController,

      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person),
        labelText: 'FullName'.tr,
        hintText: 'FullNameFieldHint'.tr,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0),),
        contentPadding: EdgeInsets.symmetric(vertical: 17, horizontal: 8,),
      ),

      validator: (value) {
        if (value!.isEmpty || value == '' || value == null) {
          return 'EmptyFieldValidate'.tr;
        }
        return null;
      },

      onChanged: (value) {
        firebaseUser.displayName = value;
      },

    );

  }

  Widget emailField() {

    emailController.text = firebaseUser.email!;

    return TextFormField(

      readOnly: true,
      enabled: false,

      controller: emailController,
      keyboardType: TextInputType.emailAddress,

      decoration: InputDecoration(
        prefixIcon: Icon(Icons.email,),
        labelText: 'Email',
        hintText: 'EmailFieldHint'.tr,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0),),
        contentPadding: EdgeInsets.symmetric(vertical: 17, horizontal: 8,),
      ),

    );

  }

  Widget phoneNumberField() {

    phoneNumberController.text = firebaseUser.phoneNumber!;

    return TextFormField(

      controller: phoneNumberController,
      keyboardType: TextInputType.phone,

      decoration: InputDecoration(
        prefixIcon: Icon(Icons.phone),
        labelText: 'PhoneNumber'.tr,
        hintText: 'PhoneNumberFieldHint'.tr,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0),),
        contentPadding: EdgeInsets.symmetric(vertical: 17, horizontal: 8,),
      ),

      validator: (value) {
        if (value!.isEmpty || value == '' || value == null ||  value == '(+84) ' || value == '(+84)') {
          return 'EmptyFieldValidate'.tr;
        }
        return null;
      },

      onChanged: (value) {
        firebaseUser.phoneNumber = value;
      },

    );

  }

  void showPaymentAlert(String title, String message) {

    TargetPlatform platform = Theme.of(context).platform;

    if (platform == TargetPlatform.iOS) {
      paymentConfirmCupertinoAlert(title, message);
    } else {
      paymentConfirmMaterialAlert(title, message);
    }

  }

  void paymentConfirmMaterialAlert(String title, String message) {
    showDialog(context: context, builder: (context) {
      return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              child: Text('Cancel'.tr,),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text('Confirm'.tr,),
              onPressed: () => saveTicketToFirebase(),
            ),
          ],
      );
    });
  }

  void paymentConfirmCupertinoAlert(String title, String message) {
    showCupertinoDialog(context: context, builder: (context) {
      return CupertinoAlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            CupertinoButton(
              child: Text('Cancel'.tr, style: TextStyle(color: CupertinoColors.destructiveRed),),
              onPressed: () => Navigator.of(context).pop(),
            ),
            CupertinoButton(
              child: Text('Confirm'.tr, style: TextStyle(color: CupertinoColors.activeBlue),),
              onPressed: () => saveTicketToFirebase(),
            ),
          ],
      );
    });
  }

  void saveTicketToFirebase() async {

    var flightQuerySnapshot = await FirebaseFirestore.instance.collection('flights').where('id', isEqualTo: widget.flightID).get();

    flightQuerySnapshot.docs.forEach((doc) {
      if (widget.seatClass == 'Economy') {
        doc.reference.update({
          'economyRemainingSeats': widget.remainingSeats - widget.adultPassenger - widget.childPassenger - widget.infantPassenger
        });
        print('economyRemainingSeats = ${doc.get('economyRemainingSeats').toString()}');
      } else if (widget.seatClass == 'Business') {
        doc.reference.update({
          'businessRemainingSeats': widget.remainingSeats - widget.adultPassenger - widget.childPassenger - widget.infantPassenger
        });
        print('businessRemainingSeats = ${doc.get('businessRemainingSeats').toString()}');
      }
    });

    var returnFlightQuerySnapshot = await FirebaseFirestore.instance.collection('flights').where('id', isEqualTo: widget.returnFlightID).get();

    returnFlightQuerySnapshot.docs.forEach((doc) {
      if (widget.returnSeatClass == 'Economy') {
        doc.reference.update({
          'economyRemainingSeats': widget.returnRemainingSeats - widget.adultPassenger - widget.childPassenger - widget.infantPassenger
        });
        print('economyRemainingSeats = ${doc.get('economyRemainingSeats').toString()}');
      } else if (widget.returnSeatClass == 'Business') {
        doc.reference.update({
          'businessRemainingSeats': widget.returnRemainingSeats - widget.adultPassenger - widget.childPassenger - widget.infantPassenger
        });
        print('businessRemainingSeats = ${doc.get('businessRemainingSeats').toString()}');
      }
    });

    TicketController().createTicket(   // tạo vé chuyến bay đi - vé người lớn
      departureLocationName: widget.departureLocationName,
      arrivalLocationName: widget.arrivalLocationName,
      departureLocationSymbol: widget.departureLocationSymbol,
      arrivalLocationSymbol: widget.arrivalLocationSymbol,
      departureDate: widget.departureDate,
      arrivalDate: widget.arrivalDate,
      departureTime: widget.departureTime,
      arrivalTime: widget.arrivalTime,
      flightTimeDuration: widget.flightTimeDuration,
      seatClass: widget.seatClass,
      ticketPrice: widget.ticketPrice,
      ticketType: 'Adult ticket',
      flightID: widget.flightID,
      ticketID: 'Adult-Ticket-${widget.flightID}-${firebaseUser.uid}-${DateFormat('dd.MM.yyyy-HH:mm:ss').format(DateTime.now())}',
      amount: widget.adultPassenger,
    );
    TicketController().createTicket(   // tạo vé chuyến bay về - vé người lớn
      departureLocationName: widget.arrivalLocationName,
      arrivalLocationName: widget.departureLocationName,
      departureLocationSymbol: widget.arrivalLocationSymbol,
      arrivalLocationSymbol: widget.departureLocationSymbol,
      departureDate: widget.returnDate,
      arrivalDate: widget.returnArrivalDate,
      departureTime: widget.returnDepartureTime,
      arrivalTime: widget.returnArrivalTime,
      flightTimeDuration: widget.returnFlightTimeDuration,
      seatClass: widget.returnSeatClass,
      ticketPrice: widget.returnTicketPrice,
      ticketType: 'Adult ticket',
      flightID: widget.returnFlightID,
      ticketID: 'Adult-Ticket-${widget.returnFlightID}-${firebaseUser.uid}-${DateFormat('dd.MM.yyyy-HH:mm:ss').format(DateTime.now())}',
      amount: widget.adultPassenger,
    );

    if(widget.childPassenger > 0) {
      TicketController().createTicket(   // tạo vé chuyến bay đi - vé trẻ em
        departureLocationName: widget.departureLocationName,
        arrivalLocationName: widget.arrivalLocationName,
        departureLocationSymbol: widget.departureLocationSymbol,
        arrivalLocationSymbol: widget.arrivalLocationSymbol,
        departureDate: widget.departureDate,
        arrivalDate: widget.arrivalDate,
        departureTime: widget.departureTime,
        arrivalTime: widget.arrivalTime,
        flightTimeDuration: widget.flightTimeDuration,
        seatClass: widget.seatClass,
        ticketPrice: (widget.ticketPrice*0.75).toInt(),
        ticketType: 'Child ticket',
        flightID: widget.flightID,
        ticketID: 'Child-Ticket-${widget.flightID}-${firebaseUser.uid}-${DateFormat('dd.MM.yyyy-HH:mm:ss').format(DateTime.now())}',
        amount: widget.childPassenger,
      );
      TicketController().createTicket(   // tạo vé chuyến bay về - vé trẻ em
        departureLocationName: widget.arrivalLocationName,
        arrivalLocationName: widget.departureLocationName,
        departureLocationSymbol: widget.arrivalLocationSymbol,
        arrivalLocationSymbol: widget.departureLocationSymbol,
        departureDate: widget.returnDate,
        arrivalDate: widget.returnArrivalDate,
        departureTime: widget.returnDepartureTime,
        arrivalTime: widget.returnArrivalTime,
        flightTimeDuration: widget.returnFlightTimeDuration,
        seatClass: widget.returnSeatClass,
        ticketPrice: (widget.returnTicketPrice*0.75).toInt(),
        ticketType: 'Child ticket',
        flightID: widget.returnFlightID,
        ticketID: 'Child-Ticket-${widget.returnFlightID}-${firebaseUser.uid}-${DateFormat('dd.MM.yyyy-HH:mm:ss').format(DateTime.now())}',
        amount: widget.childPassenger,
      );
    }

    if(widget.infantPassenger > 0) {
      TicketController().createTicket(   // tạo vé chuyến bay đi - vé em bé
        departureLocationName: widget.departureLocationName,
        arrivalLocationName: widget.arrivalLocationName,
        departureLocationSymbol: widget.departureLocationSymbol,
        arrivalLocationSymbol: widget.arrivalLocationSymbol,
        departureDate: widget.departureDate,
        arrivalDate: widget.arrivalDate,
        departureTime: widget.departureTime,
        arrivalTime: widget.arrivalTime,
        flightTimeDuration: widget.flightTimeDuration,
        seatClass: widget.seatClass,
        ticketPrice: (widget.ticketPrice*0.5).toInt(),
        ticketType: 'Infant ticket',
        flightID: widget.flightID,
        ticketID: 'Infant-Ticket-${widget.flightID}-${firebaseUser.uid}-${DateFormat('dd.MM.yyyy-HH:mm:ss').format(DateTime.now())}',
        amount: widget.infantPassenger,
      );
      TicketController().createTicket(   // tạo vé chuyến bay về - vé em bé
        departureLocationName: widget.arrivalLocationName,
        arrivalLocationName: widget.departureLocationName,
        departureLocationSymbol: widget.arrivalLocationSymbol,
        arrivalLocationSymbol: widget.departureLocationSymbol,
        departureDate: widget.returnDate,
        arrivalDate: widget.returnArrivalDate,
        departureTime: widget.returnDepartureTime,
        arrivalTime: widget.returnArrivalTime,
        flightTimeDuration: widget.returnFlightTimeDuration,
        seatClass: widget.returnSeatClass,
        ticketPrice: (widget.returnTicketPrice*0.5).toInt(),
        ticketType: 'Infant ticket',
        flightID: widget.returnFlightID,
        ticketID: 'Infant-Ticket-${widget.returnFlightID}-${firebaseUser.uid}-${DateFormat('dd.MM.yyyy-HH:mm:ss').format(DateTime.now())}',
        amount: widget.infantPassenger,
      );
    }

    TicketController().ticketSuccessBookingNotification();
    TicketController().ticketScheduleNotification(
      departureLocationName: widget.departureLocationName,
      arrivalLocationName: widget.arrivalLocationName,
      departureLocationSymbol: widget.departureLocationSymbol,
      arrivalLocationSymbol: widget.arrivalLocationSymbol,
      departureDate: widget.departureDate,
      departureTime: widget.departureTime,
    );
    TicketController().ticketScheduleNotification(
      departureLocationName: widget.arrivalLocationName,
      arrivalLocationName: widget.departureLocationName,
      departureLocationSymbol: widget.arrivalLocationSymbol,
      arrivalLocationSymbol: widget.departureLocationSymbol,
      departureDate: widget.returnDate,
      departureTime: widget.returnDepartureTime,
    );

    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => MainHome(tabIndex: 2, bookingHistory: true,)), (_) => false,);
    Fluttertoast.showToast(msg: 'SuccessfullyPayment'.tr, fontSize: 15, toastLength: Toast.LENGTH_LONG, backgroundColor: Colors.blue,);

  }

}