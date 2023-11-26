import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await openDatabase(
      join(await getDatabasesPath(), 'course.db'),
    );
    print(_database.toString());
    return _database!;
  }

  Future<List<Map<String, dynamic>>> getItems() async {
    final Database db = await database;
    final List<Map<String, dynamic>> items =
        await db.rawQuery('SELECT * FROM courses');
    return items;
  }

  Future<void> addItem(Map<String, dynamic> newItem) async {
    final Database db = await database;
    await db.insert(
      'courses',
      newItem,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> removeItem(int id) async {
    final Database db = await database;
    await db.delete('courses', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> sumPrice() async {
    final Database db = await database;
    List<Map<String, dynamic>> result =
        await db.rawQuery('SELECT SUM (price) AS total FROM courses');
    return result[0]['total'] ?? 0;
  }
}
