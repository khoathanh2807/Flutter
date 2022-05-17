import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../lib/repositories/repository.dart';
import '../../lib/repositories/in_memory_cache.dart';

void main() {

  Repository repo = InMemoryCache();

  test('Test InMemory Repository', (){

    expect(repo.getAll().isEmpty, true);    // test repo có Empty hay không

    Model newModel = repo.create();   // khởi tạo model mới
    expect(newModel.id, 1);

    expect(repo.getAll().isEmpty, false);

    Model? existedModel = repo.get(1);    // lấy ra phần tử có id = 1 rồi gán vào biến existedModel
    expect(newModel, existedModel);   // kiểm tra model vừa khởi tạo ở trên (newModel) và existedModel có giống nhau hay không

    Model newModel2 = repo.create();    // khởi tạo tiếp thêm 1 model mới
    expect(repo.getAll().length, 2);    // kiểm tra tổng số phần tử hiện có có phải là 2 hay không

  });

  test('Test Model', (){

    Model newModel = Model(id: 3, data: {'task_name' : 'Finish all assignments'});
    expect(newModel.id, 3);

    expect(newModel.data.isEmpty, false);

    expect(newModel.data['task_name'], 'Finish all assignments');

  });

}
