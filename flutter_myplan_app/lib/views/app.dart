import 'package:flutter/material.dart';
import './home_screen.dart';

class MyPlanApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'My Plan',
      home: Scaffold(
        body: HomeScreen(),
      ),
    );

  }

}