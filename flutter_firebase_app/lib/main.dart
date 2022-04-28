import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import './views/app.dart';

final FirebaseMessaging messaging = FirebaseMessaging.instance;
void main() {
  FirebaseMessaging.onBackgroundMessage(_firebaseBackgroundMessageReceived);
  runApp(App());
}

Future _firebaseBackgroundMessageReceived(RemoteMessage message) async {
  print("Notification: ${message.notification!.title} - ${message.notification!.body}");
}