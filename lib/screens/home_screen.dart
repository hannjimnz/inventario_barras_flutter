import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inventario"),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _menuButton(
            context,
            "Registrar producto",
            Icons.add_box,
          ),
          const SizedBox(height: 15),

          _menuButton(
            context,
            "Entrada de productos",
            Icons.login,
          ),
          const SizedBox(height: 15),

          _menuButton(
            context,
            "Salida de productos",
            Icons.logout,
          ),
          const SizedBox(height: 15),

          _menuButton(
            context,
            "Reporte de inventario",
            Icons.inventory,
          ),
          const SizedBox(height: 15),

          _menuButton(
            context,
            "Cámara",
            Icons.camera_alt,
          ),
        ],
      ),
    );
  }

  Widget _menuButton(
    BuildContext context,
    String titulo,
    IconData icono,
  ) {
    return SizedBox(
      height: 70,
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: Icon(icono, size: 30),
        label: Text(
          titulo,
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}