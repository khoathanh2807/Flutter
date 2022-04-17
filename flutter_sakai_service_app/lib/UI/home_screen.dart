import 'package:flutter/material.dart';
import 'package:flutter_sakai_service_app/UI/login_screen.dart';
import 'dart:async';

import '../sakai_services.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({Key? key}) : super(key:key);

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }

}

class _HomeScreenState extends State<StatefulWidget> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text('Sakai Service App'),
        actions: [
          _logOut()
        ],
      ),

      body: Container(
        child: Center(
          child: Text('Home Screen'),
        )
      ),

    );

  }

  Widget _logOut() {

    return IconButton(

      icon: Icon(Icons.logout),
      tooltip: 'Log Out',
      onPressed: () {
        // Navigator.of(context).pushReplacementNamed('/login');
        // Navigator.pushReplacementNamed(context, '/login');
        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
      },

    );

  }

}