import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHistory {
  static final DatabaseHistory _instance = DatabaseHistory._internal();

  factory DatabaseHistory() => _instance;

  static Database? _database;

  DatabaseHistory._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'history_deteksi.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE history(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nama TEXT,
        umur INTEGER,
        jen_kel INTEGER,
        ttl TEXT,
        bb REAL,
        tb REAL,
        lk REAL,
        kategori_bb TEXT
      )
    ''');
  }

  Future<void> insertHistory(String nama, int umur, int jenKel, String ttl,
      double bb, double tb, double lk, String kategoriBB) async {
    Database db = await database;
    await db.insert('history', {
      'nama': nama,
      'umur': umur,
      'jen_kel': jenKel,
      'ttl': ttl,
      'bb': bb,
      'tb': tb,
      'lk': lk,
      'kategori_bb': kategoriBB
    });
  }

  Future<List<Map<String, dynamic>>> getAllHistory() async {
    Database db = await database;
    return await db.query('history');
  }

  // Fungsi untuk mengecek apakah ada data di tabel history
  Future<bool> isHistoryAvailable() async {
    Database db = await database;
    List<Map<String, dynamic>> result =
        await db.rawQuery('SELECT COUNT(*) as count FROM history');

    int count =
        Sqflite.firstIntValue(result) ?? 0; // Ambil nilai dari hasil query
    return count > 0; // Jika count > 0, berarti ada data
  }
}
