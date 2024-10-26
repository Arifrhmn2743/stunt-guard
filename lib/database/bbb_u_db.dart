import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseBBUHelper {
  static final DatabaseBBUHelper _instance = DatabaseBBUHelper._internal();

  factory DatabaseBBUHelper() => _instance;

  static Database? _database;

  DatabaseBBUHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'bb_u.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE bbu(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        umur INTEGER,
        jen_kel INTEGER,
        sd_neg_3 REAL,
        sd_neg_2 REAL,
        sd_neg_1 REAL,
        median REAL,
        sd_pos_1 REAL,
        sd_pos_2 REAL,
        sd_pos_3 REAL
      )
    ''');
  }

  Future<void> insertBeratBadan(
      int umur,
      int jenKel,
      double sdNeg3,
      double sdNeg2,
      double sdNeg1,
      double median,
      double sdPos1,
      double sdPos2,
      double sdPos3) async {
    Database db = await database;
    await db.insert('bbu', {
      'umur': umur,
      'jen_kel': jenKel,
      'sd_neg_3': sdNeg3,
      'sd_neg_2': sdNeg2,
      'sd_neg_1': sdNeg1,
      'median': median,
      'sd_pos_1': sdPos1,
      'sd_pos_2': sdPos2,
      'sd_pos_3': sdPos3,
    });
  }

  Future<List<Map<String, dynamic>>> getAllBeratBadan() async {
    Database db = await database;
    return await db.query('bbu');
  }

  Future<bool> checkBeratBadanExist(int umur) async {
    Database db = await database;
    List<Map<String, dynamic>> result = await db.query(
      'bbu',
      where: 'umur = ?',
      whereArgs: [umur],
    );
    return result.isNotEmpty;
  }

  Future<Map<String, dynamic>?> getBeratBadanByUmur(
      int umur, int jenKel) async {
    Database db = await database;
    var result = await db.query(
      'bbu',
      where: 'umur = ? AND jen_kel = ?',
      whereArgs: [umur, jenKel],
    );

    if (result.isNotEmpty) {
      return result.first;
    } else {
      return null;
    }
  }
}
