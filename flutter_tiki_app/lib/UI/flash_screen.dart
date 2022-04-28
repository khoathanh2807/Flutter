import 'package:flutter/material.dart';

class FlashScreen extends StatefulWidget {

  @override
  _FlashScreenState createState() => _FlashScreenState();

}

class _FlashScreenState extends State<FlashScreen> {

  @override
  Widget build(BuildContext context) {

    return  Scaffold(

      appBar: AppBar(
        title: const Text("Lướt"),
        elevation: 0,
      ),

      body: Center(
          child: Text("Coming Soon!", style: TextStyle(fontSize: 30),)
      ),

    );

  }

}
