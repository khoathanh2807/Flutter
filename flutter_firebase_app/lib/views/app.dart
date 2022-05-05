import 'package:flutter/material.dart';

import './login_screen.dart';

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(
        primarySwatch: Colors.teal
      ),

      home: LoginScreen(),

    );
  }

}