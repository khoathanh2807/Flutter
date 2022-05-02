import '../models/task.dart';
import '../models/plan.dart';
// Use relative path: NOK
// import '../repositories/repository.dart';
import 'package:flutter_myplan_app/repositories/repository.dart';
// Use relative path: NOK
import 'package:flutter_myplan_app/repositories/in_memory_cache.dart';

class PlanServices {

  Repository _repository = InMemoryCache();

  Plan createPlan(String name) {
    final model = _repository.create();
    final plan = Plan.fromModel(model)..name = name;
    savePlan(plan);
    return plan;
  }

  List<Plan> getAllPlans() {
    return _repository
        .getAll()
        .map<Plan>((model) => Plan.fromModel(model))
        .toList();
  }

  void savePlan(Plan plan) {
    _repository.update(plan.toModel());
  }

  void delete(Plan plan) {
    _repository.delete(plan.toModel().id);
  }

  void addTask(Plan plan, String description) {
    print('plan.tasks = ${plan.tasks}');
    print('plan.tasks.last = ${plan.tasks.length}');
    // final id = plan.tasks.last?.id ?? 0 + 1;
    final id = (plan.tasks.length > 0) ? plan.tasks.last.id : 1;
    final task = Task(id: id, description: description);
    plan.tasks.add(task);
    savePlan(plan);
  }

  void deleteTask(Plan plan, Task task) {
    plan.tasks.remove(task);
    savePlan(plan);
  }

}