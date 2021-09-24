import 'package:sqflite/sqflite.dart';

class AppDatabase {
  static Database _instance;
  static Database get instance => _instance;

  static Future<void> open() async {
    _instance = await openDatabase('app_database', version: 1, onCreate: (Database db, int version) async {
      await db.execute(
        "CREATE TABLE tasks(id TEXT PRIMARY KEY, name TEXT, checked INTEGER)",
      );
    });
  }

  static void close() {
    _instance.close();
  }
}