import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:codigo_barras/models/producto.dart';
import 'package:codigo_barras/providers/inventario_provider.dart';
import 'package:codigo_barras/screens/scanner_screen.dart';


class EntradaScreen extends StatelessWidget {

  const EntradaScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Entrada de productos"),
      ),

      body: Center(
        child: ElevatedButton.icon(
          onPressed: () async {
              final codigo = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const ScannerScreen(),
                ),
              );
              if (codigo == null){
                return;
              }
              final producto = await context
              .read<InventarioProvider>()
              .buscarProducto(codigo);

              if (producto == null){
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Producto NO encontrado"),
                  )
                  );
                  return;
              }
              final productoActualizado = Producto(
              id: producto.id,
              codigo: producto.codigo,
              nombre: producto.nombre,
              descripcion: producto.descripcion,
              precio: producto.precio,
              existencia: producto.existencia + 1,
              imagen: producto.imagen,
            );
            await context
              .read<InventarioProvider>()
              .actualizarProducto(productoActualizado);

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Se agregó una unidad de ${producto.nombre}"),
            ),
          );
            },
          icon: const Icon(Icons.camera_alt),
          label: const Text("Escanear producto"),
        ),
      ),
    );
  }
}