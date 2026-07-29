import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/inventario_provider.dart';
import '../models/producto.dart';


class ReporteScreen extends StatefulWidget {
  const ReporteScreen({super.key});
  @override
  State<ReporteScreen> createState() =>
      _ReporteScreenState();

}
class _ReporteScreenState extends State<ReporteScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context
          .read<InventarioProvider>()
          .cargarProductos();
    });
  }

  @override
  Widget build(BuildContext context) {
    final productos =
        context.watch<InventarioProvider>().productos;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Reporte de inventario",
        ),
        centerTitle: true,
      ),
      body: productos.isEmpty
          ? const Center(

              child: Text(
                "No hay productos registrados",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),

            )

          :

          ListView.builder(

            padding: const EdgeInsets.all(15),


            itemCount: productos.length,


            itemBuilder: (context, index) {


              final Producto producto =
                  productos[index];



              return Card(

                child: ListTile(

                  leading: const Icon(
                    Icons.inventory,
                  ),


                  title: Text(
                    producto.nombre,
                  ),


                  subtitle: Column(

                    crossAxisAlignment:
                        CrossAxisAlignment.start,


                    children: [

                      Text(
                        "Código: ${producto.codigo}",
                      ),


                      Text(
                        "Precio: \$${producto.precio}",
                      ),


                      Text(
                        "Existencia: ${producto.existencia}",
                      ),

                    ],

                  ),

                ),

              );


            },

          ),

    );

  }

}