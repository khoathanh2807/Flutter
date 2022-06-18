import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import '../controllers/notification/notification_controller.dart';
import './views/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await NotificationController().init();
  runApp(App());
}