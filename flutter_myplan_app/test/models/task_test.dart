import 'package:flutter_test/flutter_test.dart';
import '../../lib/models/task.dart';
import '../../lib/repositories/repository.dart';

void main() {

  test('New task from Model', () {

    var model = Model(
        id: 1,
        data: {
            'description': 'Create a flutter app same as Tiki.',
            'complete': false
        }
    );

    var task1 = Task.fromModel(model);

    expect(task1.id, 1);
    expect(task1.description, 'Create a flutter app same as Tiki.');
    expect(task1.complete, false);

  });

}