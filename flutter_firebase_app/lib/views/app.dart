import 'package:flutter/material.dart';
import './login_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'xLMS',
      theme: ThemeData(
        primarySwatch: Colors.indigo
      ),
      home: LoginScreen(),
    );
  }

}