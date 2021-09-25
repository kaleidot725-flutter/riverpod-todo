import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_todo/model/database/database.dart';
import 'package:riverpod_todo/model/repository/task_repository.dart';
import 'package:riverpod_todo/viewmodel/home_viewmodel.dart';

final appDatabaseProvider = Provider((ref) {
  return AppDatabase();
});

final taskRepositoryProvider = Provider((ref) {
  return TaskRepository(ref.read(appDatabaseProvider));
});

final homeViewModelProvider = ChangeNotifierProvider((ref) {
  return HomeViewModel(ref.read(taskRepositoryProvider));
});
