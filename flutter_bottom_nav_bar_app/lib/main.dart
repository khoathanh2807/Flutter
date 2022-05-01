import 'package:flutter/material.dart';
import './app.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {

  @override
  _AppState createState() => _AppState();

}

class _AppState extends State<App> {

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