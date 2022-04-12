import 'package:flutter/material.dart';

class InfoScreen extends StatefulWidget {

  static const route = '/info';

  @override
  State<InfoScreen> createState() => _InfoScreenState();

}

class _InfoScreenState extends State<InfoScreen> {

  @override
  Widget build(BuildContext context) {

    return  Scaffold(

      appBar: AppBar(
        title: const Text("Me"),
      ),

      body: Center(
          child: Text("Coming Soon!", style: TextStyle(fontSize: 30),)
      ),

    );

  }

}
