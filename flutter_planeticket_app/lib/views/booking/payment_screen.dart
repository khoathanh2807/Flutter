import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../controllers/user_credentials/user_credentials.dart';
import '../../controllers/ticket/ticket_controller.dart';
import '../../models/user.dart';
import '../app.dart';

class PaymentScreen extends StatefulWidget {

  PaymentScreen({
    required this.departureLocationName,
    required this.arrivalLocationName,
    required this.departureLocationSymbol,
    required this.arrivalLocationSymbol,
    required this.departureDate,
    required this.arrivalDate,
    this.returnDate,
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
  });

  final String departureLocationName;
  final String arrivalLocationName;

  final String departureLocationSymbol;
  final String arrivalLocationSymbol;

  final String departureDate;
  final String arrivalDate;
  String? returnDate;

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

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();

}

class _PaymentScreenState extends State<PaymentScreen> {

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

    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    String adultAmount = '${widget.adultPassenger} Người lớn';
    String childAmount = '${widget.childPassenger} Trẻ em';
    String infantAmount = '${widget.infantPassenger} Em bé';

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

    // giá vé Người lớn, Trẻ em và Em bé
    String adultTicketPrice = NumberFormat.decimalPattern().format(widget.ticketPrice*widget.adultPassenger);
    String childTicketPrice = NumberFormat.decimalPattern().format(widget.ticketPrice*widget.childPassenger*0.75);
    String infantTicketPrice = NumberFormat.decimalPattern().format(widget.ticketPrice*widget.infantPassenger*0.5);

    // VAT và tổng giá
    String VAT = NumberFormat.decimalPattern().format(widget.ticketPrice*(widget.adultPassenger + widget.childPassenger*0.75 + widget.infantPassenger*0.5)/10);
    String totalPrice = NumberFormat.decimalPattern().format(
          widget.ticketPrice*widget.adultPassenger
        + widget.ticketPrice*widget.childPassenger*0.75
        + widget.ticketPrice*widget.infantPassenger*0.5
        + widget.ticketPrice*(widget.adultPassenger + widget.childPassenger*0.75 + widget.infantPassenger*0.5)/10
    );

    print('adultTicketPrice = $adultTicketPrice');
    print('childTicketPrice = $childTicketPrice');
    print('infantTicketPrice = $infantTicketPrice');
    print('VAT = $VAT');
    print('totalPrice = $totalPrice');

    return  Scaffold(

      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[200],

      appBar: AppBar(
        // elevation: 0,
        centerTitle: true,
        title: Text('Thanh toán', style: TextStyle(fontWeight: FontWeight.w600,),),
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

                      Text('Thông tin chuyến bay', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,),),
                      SizedBox(height: 15,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Text('Điểm đi', style: TextStyle(fontStyle: FontStyle.italic,),),
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
                                Text('Điểm đến', style: TextStyle(fontStyle: FontStyle.italic,),),
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
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text('Thông tin hành khách', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,),),
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

                      Text('Chi tiết giá', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,),),
                      SizedBox(height: 12,),

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
                          Text('Số hành khách', style: TextStyle(fontWeight: FontWeight.w500,),),
                          Text(passengerAmount, style: TextStyle(fontWeight: FontWeight.w500,),),
                        ],
                      ),
                      SizedBox(height: 12,),

                      const Divider(
                        height: 0,
                        color: Colors.grey,
                        thickness: 0.1,
                      ),
                      SizedBox(height: 13,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Spacer(),
                          Text('Vé ' + widget.seatClass, style: TextStyle(fontWeight: FontWeight.w500,),),
                        ],
                      ),
                      SizedBox(height: 12,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Giá vé Người lớn (x ${widget.adultPassenger})',),
                          Text(adultTicketPrice + ' VND', style: TextStyle(fontWeight: FontWeight.bold,),),
                        ],
                      ),
                      SizedBox(height: 12,),

                      if (widget.childPassenger > 0)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Giá vé Trẻ em (x ${widget.childPassenger})',),
                            Text(childTicketPrice + ' VND', style: TextStyle(fontWeight: FontWeight.bold,),),
                          ],
                        ),
                      if (widget.childPassenger > 0)
                        SizedBox(height: 12,),

                      if (widget.infantPassenger > 0)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Giá vé Em bé (x ${widget.infantPassenger})',),
                            Text(infantTicketPrice + ' VND', style: TextStyle(fontWeight: FontWeight.bold,),),
                          ],
                        ),
                      if (widget.infantPassenger > 0)
                        SizedBox(height: 12,),

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
                      SizedBox(height: 12,),

                      const Divider(
                        height: 0,
                        color: Colors.grey,
                        thickness: 0.1,
                      ),
                      SizedBox(height: 13,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Tổng chi phí', style: TextStyle(fontWeight: FontWeight.bold,),),
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

                        title: Text('Tôi đồng ý với Điều khoản và Điều kiện đặt vé', style: TextStyle(fontSize: 14,),),

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
                          child: Text('Huỷ', style: TextStyle(color: Theme.of(context).primaryColor,),),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.white,),
                            padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 13, horizontal: MediaQuery.of(context).size.width*0.18,),),
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
                        child: Text('Xác nhận', style: TextStyle(fontWeight: FontWeight.bold,),),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 13, horizontal: MediaQuery.of(context).size.width*0.14,),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8),),
                        ),
                        onPressed: !termsAgreement ? null : () {
                          FocusScope.of(context).unfocus();
                          if(_formKey.currentState!.validate()) {
                            showPaymentAlert('Thanh Toán', 'Bạn xác nhận Thông tin vé và Thông tin hành khách đã chính xác?\nTiến hành thanh toán ngay.');
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

    var genders = [
      'Nam',
      'Nữ',
    ];

    return  DropdownButtonFormField(

      decoration: InputDecoration(
        prefixIcon: Icon(Icons.wc),
        labelText: 'Giới tính',
        hintText: 'Chọn giới tính',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0),),
        contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 8,),
      ),
      borderRadius: BorderRadius.circular(12),
      dropdownColor: Colors.grey[200],

      value: firebaseUser.gender,

      items: genders.map((value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),

      validator: (value) {
        if (value == '' || value == null) {
          return 'Vui lòng nhập đầy đủ thông tin';
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
        labelText: 'Họ tên',
        hintText: 'Nhập đầy đủ họ tên',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0),),
        contentPadding: EdgeInsets.symmetric(vertical: 17, horizontal: 8,),
      ),

      validator: (value) {
        if (value!.isEmpty || value == '' || value == null) {
          return 'Vui lòng nhập đầy đủ thông tin';
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

      controller: emailController,
      keyboardType: TextInputType.emailAddress,

      decoration: InputDecoration(
        prefixIcon: Icon(Icons.email,),
        labelText: 'Email',
        hintText: 'Nhập email',
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
        labelText: 'Số điện thoại',
        hintText: 'Nhập số điện thoại',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0),),
        contentPadding: EdgeInsets.symmetric(vertical: 17, horizontal: 8,),
      ),

      validator: (value) {
        if (value!.isEmpty || value == '' || value == null ||  value == '(+84) ') {
          return 'Vui lòng nhập đầy đủ thông tin';
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
              child: Text('Huỷ'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text('Xác nhận'),
              onPressed: () => saveTicketToFirebase(),
            ),
          ]
      );
    }
    );
  }

  void paymentConfirmCupertinoAlert(String title, String message) {
    showCupertinoDialog(context: context, builder: (context) {
      return CupertinoAlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            CupertinoButton(
              child: Text('Huỷ', style: TextStyle(color: CupertinoColors.destructiveRed),),
              onPressed: () => Navigator.of(context).pop(),
            ),
            CupertinoButton(
              child: Text('Xác nhận', style: TextStyle(color: CupertinoColors.activeBlue),),
              onPressed: () => saveTicketToFirebase(),
            ),
          ]
      );
    }
    );
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

    // int adultPassengerAmount = widget.adultPassenger;
    // int childPassengerAmount = widget.childPassenger;
    // int infantPassengerAmount = widget.infantPassenger;

    TicketController().createTicket(
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
        ticketType: 'Vé người lớn',
        flightID: widget.flightID,
        ticketID: 'Adult-Ticket-${widget.flightID}-${firebaseUser.uid}-${DateFormat('dd.MM.yyyy-HH:mm:ss').format(DateTime.now())}',
        amount: widget.adultPassenger,
    );

    if(widget.childPassenger > 0) {
      TicketController().createTicket(
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
        ticketType: 'Vé trẻ em',
        flightID: widget.flightID,
        ticketID: 'Child-Ticket-${widget.flightID}-${firebaseUser.uid}-${DateFormat('dd.MM.yyyy-HH:mm:ss').format(DateTime.now())}',
        amount: widget.childPassenger,
      );
    }

    if(widget.infantPassenger > 0) {
      TicketController().createTicket(
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
        ticketType: 'Vé em bé',
        flightID: widget.flightID,
        ticketID: 'Infant-Ticket-${widget.flightID}-${firebaseUser.uid}-${DateFormat('dd.MM.yyyy-HH:mm:ss').format(DateTime.now())}',
        amount: widget.infantPassenger,
      );
    }

    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => MainHome()), (_) => false,);
    Fluttertoast.showToast(msg: 'Thanh toán thành công, hãy kiểm tra vé ở mục Lịch sử đặt vé', fontSize: 15, toastLength: Toast.LENGTH_LONG, backgroundColor: Colors.blue,);

  }

}