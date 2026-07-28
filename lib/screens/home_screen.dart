import 'package:flutter/material.dart';

import 'camera_demo_screen.dart';
import 'entrada_screen.dart';
import 'registrar_producto_screen.dart';
import 'reporte_screen.dart';
import 'salida_screen.dart';

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
            (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const RegistrarProductoScreen(),
                ),
              );
            }
          ),
          const SizedBox(height: 15),

          _menuButton(
            context,
            "Entrada de productos",
            Icons.login,
            (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_)=> const EntradaScreen(),
                ),
              );
            }
          ),
          const SizedBox(height: 15),

          _menuButton(
            context,
            "Salida de productos",
            Icons.logout,
            (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SalidaScreen(),
                ),
              
              );
            }
          ),
          const SizedBox(height: 15),

          _menuButton(
            context,
            "Reporte de inventario",
            Icons.inventory,
            (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ReporteScreen(),
                ),
              );
            }
          ),
          const SizedBox(height: 15),

          _menuButton(
            context,
            "Cámara",
            Icons.camera_alt,
            (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CameraDemoScreen(),
                ),
              );
            }
          ),
        ],
      ),
    );
  }

  Widget _menuButton(
    BuildContext context,
    String titulo,
    IconData icono,
    VoidCallback onPressed,
  ) {
    return SizedBox(
      height: 70,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icono, size: 30),
        label: Text(
          titulo,
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}