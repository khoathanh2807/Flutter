import 'package:flutter/material.dart';

class BookingScreen extends StatefulWidget {

  @override
  State<BookingScreen> createState() => _BookingScreenState();

}

class _BookingScreenState extends State<BookingScreen> {

  @override
  Widget build(BuildContext context) {

    return  Scaffold(

      appBar: AppBar(
        title: const Text("Đặt vé"),
        elevation: 0,
      ),

      body: Center(
          child: Text("Coming Soon!", style: TextStyle(fontSize: 30),)
      ),

    );

  }

}
