import 'package:flutter/material.dart';

import '../database/database_helper.dart';
import '../models/producto.dart';

class InventarioProvider extends ChangeNotifier {
  final DatabaseHelper _db = DatabaseHelper.instance;

  List<Producto> _productos = [];

  List<Producto> get productos => _productos;

  Future<void> cargarProductos() async {
  _productos = await _db.obtenerProductos();

  notifyListeners();
}

Future<void> agregarProducto(Producto producto) async {
  await _db.insertarProducto(producto);

  await cargarProductos();
}
Future<Producto?> buscarProducto(String codigo) async {
  return await _db.buscarPorCodigo(codigo);
}
Future<void> actualizarProducto(Producto producto) async {
  await _db.actualizarProducto(producto);

  await cargarProductos();
}
Future<void> eliminarProducto(int id) async {
  await _db.eliminarProducto(id);

  await cargarProductos();
}
}
