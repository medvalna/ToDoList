import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:to_do_list/models/todo.dart';

class PersistenceManager {
  //Stream.value()asBroadcast;
  PersistenceManager._();

  static final PersistenceManager db = PersistenceManager._();

  static const _tableName = "to_do";

  static Database? _database;

  Future<Database> get _databaseGetter async {

    if (_database != null)
      return _database!;

    _database = await initDB();
    return _database!;
  }

  initDB() async {
    final appDirectory = await getApplicationDocumentsDirectory();
    _database = await openDatabase(
      '${appDirectory.path}/to_do.db',
      version: 1,
      onCreate: (db, version) {
        db.execute(
            'CREATE TABLE $_tableName (id INTEGER PRIMARY KEY, task TEXT, isDone INTEGER)');
      },
    );
    return _database;
  }

/*
  todos() async {
    // Get a reference to the database.
    final db = await _databaseGetter;
    final List<Map<String?, dynamic>> items = await db.query(_tableName);
    return List.generate(items.length, (i) {
      int id = items[i]['id'];
      return ToDo(
        id: id,
        task: items[i]['task'],
        isDone: items[i]['isDone'] == 10 ? null : items[i]['isDone'] == 1 ? true : false ,
      );
    });
  }*/

  getAllTodos() async {
    final db = await _databaseGetter;
    var res = await db.query(_tableName);
    List<ToDo> list =
        res.isNotEmpty ? res.map((c) => ToDo.fromJson(c)).toList() : [];
    return list;
  }

  saveToDo(ToDo todo) async {
    // Get a reference to the database.
    final db = await _databaseGetter;
    var res = await db.insert(
      _tableName,
      todo.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return res;
  }

  deleteToDo(int id) async {
    // Get a reference to the database.
    final db = await _databaseGetter;
    await db.delete(_tableName, where: "id= ?", whereArgs: [id]);
  }

  Future<void> changeToDo(ToDo todo) async {
    print("im in db");
    // Get a reference to the database.
    final db = await _databaseGetter;
    await db.update(_tableName, todo.toJson(),
        where: "id = ?", whereArgs: [todo.id]);
    return;
  }

  getToDo(int id) async {
    final db = await _databaseGetter;
    var res = await db.query(_tableName, where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? ToDo.fromJson(res.first) : Null;
  }
}
