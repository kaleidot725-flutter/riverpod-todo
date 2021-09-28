import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_todo/model/entity/task.dart';
import 'package:riverpod_todo/model/repository/task_repository.dart';
import 'package:uuid/uuid.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel(this._repository);

  final TaskRepository _repository;

  List<Task> _tasks = List.empty();
  List<Task> get tasks => _tasks;

  Future<void> fetchTasks() async {
    return _repository.getAll().then((value) {
      _tasks = value;
    }).catchError((dynamic error) {
      /** Error Handling */
    }).whenComplete(() => notifyListeners());
  }

  Future<void> addTask(String name) async {
    var newTask = Task(Uuid().v4().toString(), false, name);
    _repository.insert(newTask).then((value) {
      _tasks.add(newTask);
    }).catchError((dynamic error) {
      /** Error Handling */
    }).whenComplete(() => notifyListeners());
  }
}
