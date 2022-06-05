import 'package:flutter/material.dart';

import './controllers/pizza_controller.dart';

class DataProvider extends InheritedWidget {

  DataProvider({Key? key, required Widget child}) : super(key: key, child: child);

  final _controller = PizzaController();

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;

  static PizzaController of(BuildContext context) {
    DataProvider provider = context.dependOnInheritedWidgetOfExactType<DataProvider>() as DataProvider;
    return provider._controller;
  }

}