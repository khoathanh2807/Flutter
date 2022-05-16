import 'package:flutter/material.dart';
import 'dart:async';

import './login_screen.dart';
import './platform_alert.dart';

class HomeScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }

}

class HomeScreenState extends State<StatefulWidget> {

  // final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    // final String email = ModalRoute.of(context)!.settings.arguments as String;
    // print('arguments: emailAddress = $email');

    return Scaffold(

        appBar: AppBar(
          title: Text('Trang chủ'),
          elevation: 0,
          // automaticallyImplyLeading: false,
          // actions: [
          //   _logOut()
          // ],
        ),
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

        // floatingActionButton: FloatingActionButton(
        //   child: Icon(Icons.logout),
        //   onPressed: () {
        //     Navigator.of(context).pushReplacementNamed('/login');
        //   },
        // ),

    );

  }

  Widget _logOut() {

    return IconButton(

      icon: Icon(Icons.logout),
      tooltip: 'Log Out',
      onPressed: () {
        // Navigator.of(context).pushReplacementNamed('/login');
        // Navigator.pushReplacementNamed(context, '/login');
        Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
      },

    );

  }

}