import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:to_do_list/models/todo.dart';

class PersistenceManager {
  Database? _database;
  static const _tableName = "to_do";

  Future<Database> get _databaseGetter async {
    final appDirectory = await getApplicationDocumentsDirectory();
    _database ??= await openDatabase(
      '${appDirectory.path}/to_do.db',
      version: 1,
      onCreate: (db, version) {
        db.execute(
            'CREATE TABLE $_tableName (id TEXT PRIMARY KEY, task TEXT, isDone BOOL)');
      },
    );
    return _database!;
  }

  Future<List<ToDo>> todos() async {
    // Get a reference to the database.
    final db = await _databaseGetter;
    final List<Map<String, dynamic>> items = await db.query(_tableName);
    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(items.length, (i) {
      return ToDo(
        id: items[i]['id'],
        toDoText: items[i]['toDoText'],
        isDone: items[i]['isDone'],
      );
    });
  }

  Future<void> saveToDo(ToDo todo) async {
    // Get a reference to the database.
    final db = await _databaseGetter;
    await db.insert(
      _tableName,
      todo.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
