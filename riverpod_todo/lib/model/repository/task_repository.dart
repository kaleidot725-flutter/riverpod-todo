import 'package:riverpod_todo/model/entity/task.dart';
import 'package:sqflite/sqlite_api.dart';

extension TaskExt on Task {
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'isChecked': isChecked ? 1 : 0,
    };
  }
}

class TaskRepository {
  Database _database;

  TaskRepository(this._database);

  Future<List<Task>> getAll() async {
    List<Map<String, dynamic>> maps = await _database.query("tasks");
    return List.generate(maps.length, (i) {
      return Task(maps[i]["id"], (maps[i]["isChecked"] == 1), maps[i]["name"]);
    });
  }

  Future<void> insert(Task task) async {
    _database.insert("tasks", task.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> delete(Task task) async {
    _database.delete("tasks", where: "id = ?", whereArgs: [task.id]);
    return true;
  }

  Future<void> update(Task task) async {
    _database
        .update("tasks", task.toMap(), where: "id = ?", whereArgs: [task.id]);
  }
}
