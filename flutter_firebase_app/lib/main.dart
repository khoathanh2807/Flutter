import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

// import './data_provider.dart';
import './views/app.dart';

final FirebaseMessaging messaging = FirebaseMessaging.instance;

void main() {
  Firebase.initializeApp().whenComplete(() {
    FirebaseMessaging.onBackgroundMessage(_firebaseBackgroundMessageReceived);
  });

  // runApp(DataProvider(child: App()));
  runApp(App());
}

Future _firebaseBackgroundMessageReceived(RemoteMessage message) async {
  print("Notification: ${message.notification!.title} - ${message.notification!.body}");
}