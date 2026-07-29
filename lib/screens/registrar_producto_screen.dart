import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/producto.dart';
import '../providers/inventario_provider.dart';

import 'scanner_screen.dart';

class RegistrarProductoScreen extends StatefulWidget {
  const RegistrarProductoScreen({super.key});
  @override
  State<RegistrarProductoScreen> createState() =>
      _RegistrarProductoScreenState();

}
class _RegistrarProductoScreenState 
extends State<RegistrarProductoScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController codigoController =
      TextEditingController();
  final TextEditingController nombreController =
      TextEditingController();
  final TextEditingController descripcionController =
      TextEditingController();
  final TextEditingController precioController =
      TextEditingController();

  Future<void> guardarProducto() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    final producto = Producto(
      codigo: codigoController.text,
      nombre: nombreController.text,
      descripcion: descripcionController.text,
      precio: double.parse(precioController.text),
      existencia: 0,
    );
    await context
        .read<InventarioProvider>()
        .agregarProducto(producto);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          "Producto guardado correctamente",
        ),
      ),
    );
    codigoController.clear();
    nombreController.clear();
    descripcionController.clear();
    precioController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Registrar producto",
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: codigoController,
                decoration: const InputDecoration(
                  labelText: "Código de barras",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(
                    Icons.qr_code,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Ingrese el código";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),

              ElevatedButton.icon(
                onPressed: () async {
                  final codigo = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const ScannerScreen(),
                    ),
                  );
                  if (codigo != null){
                    codigoController.text = codigo;
                  }

                },

                icon: const Icon(
                  Icons.camera_alt,
                ),

                label:const Text("Escanear codigo"),

              ),

              const SizedBox(height: 15),
              TextFormField(
                controller: nombreController,
                decoration: const InputDecoration(
                  labelText: "Nombre del producto",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(
                    Icons.inventory,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Ingrese el nombre";

                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: descripcionController,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: "Descripción",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(
                    Icons.description,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: precioController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Precio",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(
                    Icons.attach_money,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Ingrese el precio";
                  }
                  if (double.tryParse(value) == null) {
                    return "Ingrese un precio válido";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 25),
              SizedBox(
                height: 55,
                child: ElevatedButton.icon(
                  onPressed: guardarProducto,
                  icon: const Icon(
                    Icons.save,
                  ),
                  label: const Text(
                    "Guardar producto",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    codigoController.dispose();
    nombreController.dispose();
    descripcionController.dispose();
    precioController.dispose();
    super.dispose();
  }
}