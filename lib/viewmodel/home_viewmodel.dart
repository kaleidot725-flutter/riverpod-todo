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

  String _taskName = "";
  String get taskName => _taskName;

  Future<void> fetchTasks() async {
    return _repository.getAll().then((value) {
      _tasks = value;
    }).catchError((dynamic error) {
      /** Error Handling */
    }).whenComplete(() => notifyListeners());
  }

  Future<void> addTask() async {
    var newTask = Task(Uuid().v4().toString(), false, taskName);
    _repository.insert(newTask).then((value) {
      _tasks.add(newTask);
    }).catchError((dynamic error) {
      /** Error Handling */
    }).whenComplete(() => notifyListeners());
  }

  Future<void> checkTask(Task task) async {
    var newTask = Task(task.id, !task.isChecked, task.name);
    _repository
        .update(newTask)
        .then((value) {
          var index = _tasks.indexOf(task);
          _tasks.remove(task);
          _tasks.insert(index, newTask);
        })
        .catchError((dynamic error) {})
        .whenComplete(() => notifyListeners());
  }

  void inputTaskName(String name) {
    _taskName = name;
    notifyListeners();
  }
}
