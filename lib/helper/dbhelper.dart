import 'dart:async';
import 'dart:io';
import 'package:delicate/models/keranjang.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

// class DbHelper {
//   final String _databaseName = 'delicate.db';
//   final int _databaseVersion = 1;

//   // Tabel Keranjang
//   final String table = 'keranjang';
//   final String id = 'id';
//   final String produk_id = 'produk_id';
//   final String nama_produk = 'nama_produk';
//   final String harga = 'harga';
//   final String total = 'total';
//   final String qty = 'qty';
//   final String pelanggan_id = 'pelanggan_id';
//   final String tokoid = 'tokoid';

//   Database? _database;
//   Future<Database> get database async {
//     if (_database == null) {
//       _database = await _initDatabase();
//     }
//     return _database!;
//   }
//   // Future<Database> database() async {
//   //   if (_database == null) return _database!;
//   //   _database = await _initDatabase();
//   //   return _database!;
//   // }

//   Future _initDatabase() async {
//     Directory documentsDirectory = await getApplicationDocumentsDirectory();
//     String path = documentsDirectory.path + 'delicate.db';
//     return openDatabase(path, version: _databaseVersion, onCreate: _onCreate);
//   }

//   Future _onCreate(Database db, int version) async {
//     await db.execute(
//         'CREATE TABLE IF NOT EXISTS $table ($id INTEGER PRIMARY KEY, $produk_id INTEGER, $nama_produk STRING, $harga INTEGER, $total INTEGER, $qty INTEGER, $pelanggan_id INTEGER, $tokoid INTEGER)');
//   }

//   Future<List<Keranjang>> all() async {
//     final data = await _database!.query(table);
//     List<Keranjang> result = data.map((e) => Keranjang.fromJson(e)).toList();
//     return result;
//   }

//   Future<List<Map<String, dynamic>>> selectkeranjang() async {
//     Database db = await this.database;
//     var mapList = await db.query('keranjang');
//     return mapList;
//   }

//   Future<List<Keranjang>> getkeranjang() async {
//     var mapList = await selectkeranjang();
//     int count = mapList.length;
//     List<Keranjang> list = <Keranjang>[];
//     for (int i = 0; i < count; i++) {
//       list.add(Keranjang.fromMap(mapList[i]));
//     }
//     return list;
//   }

//   // Future<int> insert(Map<String, dynamic> row) async {
//   //   final query = await _database!.insert(table, row);
//   //   return query;
//   // }
// }

class DbHelper {
  static DbHelper? _dbHelper;
  static Database? _database;

  DbHelper._createObject();

  factory DbHelper() {
    if (_dbHelper == null) {
      _dbHelper = DbHelper._createObject();
    }
    return _dbHelper!;
  }

  Future<Database> initDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'delicate.db';

    var todoDatabase = openDatabase(path, version: 1, onCreate: _createDb);

    return todoDatabase;
  }

  //buat tabel baru
  void _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE keranjang (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        produk_id INTEGER,
        toko_id INTEGER,
        nama_produk TEXT,
        harga INTEGER,
        qty INTEGER,
        total INTEGER,
        gambar TEXT,
        pelanggan_id INTEGER,
      );
    ''');
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initDb();
    }
    return _database!;
  }

  Future<List<Map<String, dynamic>>> selectkeranjang() async {
    Database db = await this.database;
    var mapList = await db.query('keranjang');
    return mapList;
  }

  Future<List<Keranjang>> getkeranjang() async {
    var mapList = await selectkeranjang();
    int count = mapList.length;
    List<Keranjang> list = <Keranjang>[];
    for (int i = 0; i < count; i++) {
      list.add(Keranjang.fromMap(mapList[i]));
    }
    return list;
  }

}
