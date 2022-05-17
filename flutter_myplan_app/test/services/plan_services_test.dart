import 'package:flutter_test/flutter_test.dart';
import '../../lib/models/plan.dart';
import '../../lib/services/plan_services.dart';

void main() {

  test('Test create plan', () {

    PlanServices planServices = PlanServices();

    planServices.createPlan('Create screen to view details of product.');

    var allPlans = planServices.getAllPlans();
    expect(1, allPlans.length);

  });

  test('Test create addTask', () {

    PlanServices planServices = PlanServices();

    var plan = Plan(id: 1);
    var description = 'Try to make a screen to display product';
    planServices.addTask(plan, description);

  });

}