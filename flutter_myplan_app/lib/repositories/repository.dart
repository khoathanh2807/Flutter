import 'package:flutter/foundation.dart';

abstract class Repository {

  Model create();   // thêm data

  List<Model> getAll();   // lấy ra tất cả data từ Repository

  Model? get(int id);   // lấy ra data dựa theo id

  int update(Model item);   // sửa / cập nhật data

  Model? delete(int id);    // xóa data

  void clear();

}

class Model {

  final int id;
  final Map data;

  const Model({
    required this.id,
    this.data = const{}
  });

}