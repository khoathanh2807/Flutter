import 'package:flutter/material.dart';

class InfoScreen extends StatefulWidget {

  @override
  _InfoScreenState createState() => _InfoScreenState();

}

class _InfoScreenState extends State<InfoScreen> {

  @override
  Widget build(BuildContext context) {

    return  Scaffold(

      appBar: AppBar(
        title: const Text("Cá Nhân"),
        elevation: 0,
      ),

      body: Center(
          child: Text("Coming Soon!", style: TextStyle(fontSize: 30),)
      ),

    );

  }

}
