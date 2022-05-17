import 'package:flutter/material.dart';
import './controllers/plan_controller.dart';

class PlanProvider extends InheritedWidget {

  PlanProvider({Key? key, required Widget child}) : super(key: key, child: child);

  final _controller = PlanController();

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;

  static PlanController of(BuildContext context) {

    PlanProvider provider = context.dependOnInheritedWidgetOfExactType<PlanProvider>() as PlanProvider;
    return provider._controller;

  }

} 