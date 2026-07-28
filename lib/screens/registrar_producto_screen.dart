import 'package:flutter/material.dart';


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



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Registrar producto"),
      ),

      body: const Center(
        child: Text(
          "Aqui ira el formulario",
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