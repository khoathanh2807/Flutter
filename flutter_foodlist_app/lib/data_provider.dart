import 'package:flutter/material.dart';

import './controller/pizza_controller.dart';

class DataProvider extends InheritedWidget {

  final _controller = PizzaController();

  DataProvider({Key? key, required Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;

  static PizzaController of(BuildContext context) {

    DataProvider provider = context.dependOnInheritedWidgetOfExactType<DataProvider>() as DataProvider;

    return provider._controller;

  }

}