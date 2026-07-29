import 'package:flutter/material.dart';

class CameraDemoScreen extends StatelessWidget {

  const CameraDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cámara"),
      ),

      body: const Center(
        child: Text(
          "Aquí estará el lector de códigos",
        ),
      ),
    );
  }
}