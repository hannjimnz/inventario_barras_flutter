import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/producto.dart';
import '../utils/constants.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('inventario.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();

    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE productos(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        codigo TEXT UNIQUE NOT NULL,
        nombre TEXT NOT NULL,
        descripcion TEXT,
        precio REAL NOT NULL,
        existencia INTEGER NOT NULL,
        imagen TEXT
      )
    ''');
  }
  Future<int> insertarProducto(Producto producto) async {
  final db = await instance.database;

  return await db.insert(
    DBConstants.tablaProductos,
    producto.toMap(),
    conflictAlgorithm: ConflictAlgorithm.abort,
  );
}

Future<List<Producto>> obtenerProductos() async {
  final db = await instance.database;

  final resultado = await db.query(
    DBConstants.tablaProductos,
    orderBy: 'nombre ASC',
  );

  return resultado.map((map) => Producto.fromMap(map)).toList();
}
Future<Producto?> buscarPorCodigo(String codigo) async {
  final db = await instance.database;

  final resultado = await db.query(
    DBConstants.tablaProductos,
    where: 'codigo = ?',
    whereArgs: [codigo],
    limit: 1,
  );

  if (resultado.isNotEmpty) {
    return Producto.fromMap(resultado.first);
  }

  return null;
}
Future<int> actualizarProducto(Producto producto) async {
  final db = await instance.database;

  return await db.update(
    DBConstants.tablaProductos,
    producto.toMap(),
    where: 'id = ?',
    whereArgs: [producto.id],
  );
}
Future<int> eliminarProducto(int id) async {
  final db = await instance.database;

  return await db.delete(
    DBConstants.tablaProductos,
    where: 'id = ?',
    whereArgs: [id],
  );
}
}