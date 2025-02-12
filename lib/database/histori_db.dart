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
    await deleteDatabase(path);
    return await openDatabase(
      path,
      version: 2,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      await db.execute('ALTER TABLE history ADD COLUMN tgl_deteksi TEXT');
    }
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE history (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nama TEXT,
        umur INTEGER,
        jen_kel INTEGER,
        ttl TEXT,
        tgl_deteksi TEXT,
        bb REAL,
        tb REAL,
        kategori_bb TEXT
      )
    ''');
  }

  Future<void> insertHistory(String nama, int umur, int jenKel, String ttl,
      String tglDeteksi, double bb, double tb, String kategoriBB) async {
    Database db = await database;
    await db.insert('history', {
      'nama': nama,
      'umur': umur,
      'jen_kel': jenKel,
      'ttl': ttl,
      'tgl_deteksi': tglDeteksi,
      'bb': bb,
      'tb': tb,
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

  Future<void> clearHistory() async {
    final Database db = await database;
    await db.delete('history');
  }

  Future<List<Map<String, dynamic>>> getChartDataById(int id) async {
    final db = await database;
    final result = await db.query(
      'history',
      columns: ['umur', 'tb', 'kategori_bb', 'jen_kel'],
      where: 'id = ?',
      whereArgs: [id],
      orderBy: 'umur ASC',
    );

    // Konversi data agar aman
    return result.map((item) {
      return {
        'umur': (item['umur'] as num).toDouble(), // Pastikan double
        'tb': (item['tb'] as num).toDouble(), // Pastikan double
        'kategori_bb': item['kategori_bb'], // Tetap String
        'jen_kel': item['jen_kel'], // Tetap int
      };
    }).toList();
  }
}
