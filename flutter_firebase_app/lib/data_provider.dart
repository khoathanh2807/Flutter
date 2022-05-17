import 'package:flutter/material.dart';

import './shared/firebase_authentication.dart';

class DataProvider extends InheritedWidget {

  DataProvider({Key? key, required Widget child}) : super(key: key, child: child);

  FirebaseAuthentication auth = FirebaseAuthentication();

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;

  static FirebaseAuthentication of(BuildContext context) {

    DataProvider provider = context.dependOnInheritedWidgetOfExactType<DataProvider>() as DataProvider;
    return provider.auth;

  }

}