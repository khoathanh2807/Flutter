import 'package:flutter/material.dart';

import './login_screen.dart';

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      title: 'Login Form',

      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        // brightness: Brightness.dark,
        visualDensity:VisualDensity.adaptivePlatformDensity,
      ),

      home: LoginScreen(),

    );

  }

}

