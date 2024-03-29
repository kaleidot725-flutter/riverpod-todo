import 'package:riverpod_todo/model/database/task_table.dart';
import 'package:sqflite/sqflite.dart';
import 'table.dart';

class AppDatabase {
  AppDatabase();

  Database? _instance;
  Database get instance => _instance!;

  TaskTable _taskTable = TaskTable();
  TaskTable get taskTable => _taskTable;

  Future<void> open() async {
    if (_instance != null) {
      close();
    }

    _instance = await openDatabase('app_database', version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
        taskTable.getCreateCommand(),
      );
    });
  }

  void close() {
    _instance?.close();
  }
}
