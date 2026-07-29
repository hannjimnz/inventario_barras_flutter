import 'package:flutter/material.dart';

class EntradaScreen extends StatelessWidget {

  const EntradaScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Entrada de productos"),
      ),

      body: const Center(
        child: Text(
          "Pantalla de entrada",
        ),
      ),
    );
  }
}