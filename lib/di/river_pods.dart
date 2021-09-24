import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_todo/model/database/database.dart';

final appDatabaseProvider = StateNotifierProvider((_) => AppDatabase());
