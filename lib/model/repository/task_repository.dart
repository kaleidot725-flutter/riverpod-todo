import 'package:riverpod_todo/model/database/database.dart';
import 'package:riverpod_todo/model/database/task_table.dart';
import 'package:riverpod_todo/model/entity/task.dart';
import 'package:sqflite/sqlite_api.dart';

class TaskRepository {
  AppDatabase _db;

  TaskRepository(this._db);

  Future<List<Task>> getAll() async {
    List<Map<String, dynamic>> maps =
        await _db.instance.query(_db.taskTable.name);
    return List.generate(maps.length, (i) {
      // FIXME non-null
      return _db.taskTable.toEntity(maps[i])!;
    });
  }

  Future<void> insert(Task task) async {
    _db.instance.insert(
      _db.taskTable.name,
      _db.taskTable.toMap(task),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> delete(Task task) async {
    _db.instance.delete(
      _db.taskTable.name,
      where: "${_db.taskTable.columnId} = ?",
      whereArgs: [task.id],
    );
  }

  Future<void> update(Task task) async {
    _db.instance.update(
      _db.taskTable.name,
      _db.taskTable.toMap(task),
      where: "${_db.taskTable.columnId} = ?",
      whereArgs: [task.id],
    );
  }
}
