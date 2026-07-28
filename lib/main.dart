import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/inventario_provider.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const CodigoBarrasApp());
}

class CodigoBarrasApp extends StatelessWidget {
  const CodigoBarrasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => InventarioProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Inventario',

        theme: ThemeData(
          colorSchemeSeed: Colors.blue,
          useMaterial3: true,
        ),

        home: const HomeScreen(),
      ),
    );
  }
}