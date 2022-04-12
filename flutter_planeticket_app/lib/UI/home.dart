import 'package:flutter/material.dart';
import 'dart:async';
import './login_screen.dart';
import './platform_alert.dart';

class HomeScreen extends StatefulWidget {

  static const route = '/home';

  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }

}

class HomeScreenState extends State<StatefulWidget> {

  // final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    final String email = ModalRoute.of(context)!.settings.arguments as String;
    // print('arguments: emailAddress = $email');

    return MaterialApp(

      title: 'Airplane Ticket Booking',

      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),

      home: Scaffold(

        appBar: AppBar(title: Text(email),),
        // backgroundColor: Colors.blueGrey,

        body: Container(
          // color: Theme.of(context).primaryColor,
          margin: EdgeInsets.all(20.0),
          child: ListView(

            children: [
              Text('Vui lòng chọn chuyến bay...')
            ],

          ),
        ),

        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.home),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(LoginScreen.route);
          },
        ),

      ),

    );

  }

}