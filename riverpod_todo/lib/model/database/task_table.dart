import 'package:riverpod_todo/model/database/table.dart';
import 'package:riverpod_todo/model/entity/task.dart';

class TaskTable implements Table<Task> {
  String name = "tasks";
  String columnId = "id";
  String columnName = "name";
  String columnIsChecked = "isChecked";

  TaskTable();

  @override
  String getCreateCommand() {
    return "CREATE TABLE $name($columnId TEXT PRIMARY KEY, $columnName TEXT, $columnIsChecked INTEGER)";
  }

  @override
  Map<String, dynamic> toMap(Task task) {
    return {
      columnId: task.id,
      columnName: task.name,
      columnIsChecked: task.isChecked ? 1 : 0,
    };
  }

  @override
  Task toEntity(Map<String, dynamic> map) {
    return Task(map[columnId], (map[columnIsChecked] == 1), map[columnName]);
  }
}