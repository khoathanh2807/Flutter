import './repository.dart';

class InMemoryCache implements Repository {

  final _storage = Map<int, Model>();

  @override
  Model create() {
    final ids = _storage.keys.toList()..sort();

    final id = (ids.length == 0) ? 1 : ids.last + 1;

    final model = Model(id: id);
    _storage[id] = model;
    return model;
  }

  @override
  List<Model> getAll() {
    return _storage.values.toList(growable: false);
  }

  @override
  Model? get(int id) {
    return _storage[id];
  }

  @override
  Model? delete(int id) {
    return _storage.remove(id);
  }

  @override
  int update(Model item) {
    _storage[item.id as int] = item;

    return 0;
  }

  @override
  void clear() {
    _storage.clear();
  }

}
