import 'package:flutter/material.dart';
import './app.dart';

void main() {

  runApp(MyApp());

}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();

}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primarySwatch: Colors.teal,
        brightness: Brightness.dark,
      ),

      home: HideOnScroll(),

    );

  }

}