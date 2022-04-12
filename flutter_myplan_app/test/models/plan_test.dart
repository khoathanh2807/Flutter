import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_myplan_app/repositories/repository.dart';
import '../../lib/models/plan.dart';

void main() {

  Plan plan = Plan(id: 1);

  test('Test Plan and Task', (){

    expect(plan.id, 1);
    expect(plan.name, '');
    expect(plan.tasks.isEmpty, true);

    expect(plan.completeCount, 0);
    expect(plan.completenessMessage, '0 out of 0 tasks');

  });

  test('Test Plan\'s constructors', (){

    var model = Model(id: 1);

    var plan1 = Plan.fromModel(model);
    expect(plan1.id, 1);

  });

  // test('Test Plan\'s constructors', (){
  //   var modelTask1 = Model(id: 1, data: {
  //     'description': 'Create a flutter app same as Tiki.',
  //     'complete': false
  //   });
  //   Model model = Model(
  //     id: 5,
  //     data: {
  //       'name': 'My plan #1',
  //       'task': {
  //         '1': [
  //           modelTask1
  //         ]
  //       },
  //     }
  //   );
  //   var plan1 = Plan.fromModel(model);
  //   expect(plan1.id, 5);
  // });

}
