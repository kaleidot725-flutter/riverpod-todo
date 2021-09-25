import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_todo/model/entity/task.dart';
import 'package:riverpod_todo/model/repository/task_repository.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel(this._repository);

  final TaskRepository _repository;

  List<Task> _tasks = List.empty();
  List<Task> get tasks => _tasks;

  Future<void> fetchTasks() async {
    _repository.insert(Task("a", true, "TEST"));
    _repository.insert(Task("b", true, "TEST"));
    _repository.insert(Task("c", true, "TEST"));
    _repository.insert(Task("d", true, "TEST"));

    return _repository.getAll().then((value) {
      _tasks = value;
    }).catchError((dynamic error) {
      /** Error Handling */
    }).whenComplete(() => notifyListeners());
  }
}
