import 'package:flutter/material.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class HappyScreen extends StatefulWidget {

  @override
  _HappyScreenState createState() => _HappyScreenState();

}

class _HappyScreenState extends State<HappyScreen> {

  FirebaseAnalytics firebaseAnalytics = FirebaseAnalytics.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        elevation: 0,
        title: const Text('Firebase Analytics'),
      ),

      body: Center(
        child: ElevatedButton(
          child: const Text('I\'m happy!'),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.only(left: 40.0, right: 40.0, top: 15.0, bottom: 15.0),
          ),
          onPressed: () {
            firebaseAnalytics.logEvent(name: 'Press Happy Button', parameters: null);
          },
        ),
      ),

    );
  }

}
