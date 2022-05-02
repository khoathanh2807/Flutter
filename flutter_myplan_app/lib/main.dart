import 'package:flutter/material.dart';
// import 'package:flutter_myplan_app/plan_provider.dart';
import './plan_provider.dart';
import './views/app.dart';

void main() {

  var planProvider = PlanProvider(child: MyPlanApp());
  runApp(planProvider);

}
