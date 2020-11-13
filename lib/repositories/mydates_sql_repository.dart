import 'package:age_calculator/models/MyDate.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class MyDatesSqlRepository {
  static final _databaseName = "mydates.db";
  static final _databaseVersion = 1;

  static final table = 'mydates';

  static final columnId = 'id';
  static final columnName = 'name';
  static final columnBirthday = 'birthday';

  MyDatesSqlRepository._privateConstructor();
  static final MyDatesSqlRepository instance =
      MyDatesSqlRepository._privateConstructor();

  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnName TEXT NOT NULL,
            $columnBirthday INTEGER NOT NULL
          )
          ''');
  }

  Future<int> insert(MyDate myDate) async {
    Database db = await instance.database;
    var res = await db.insert(table, myDate.toMap());
    return res;
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    var res = await db.query(table, orderBy: "$columnName ASC");
    return res;
  }

  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> update(MyDate myDate) async {
    Database db = await instance.database;
    return await db.update(
      table,
      myDate.toMap(),
      where: "id = ?",
      whereArgs: [myDate.id],
    );
  }
}
