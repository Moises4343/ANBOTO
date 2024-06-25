import 'package:flutter/material.dart';

import './screens/register_screen.dart';
import './screens/store_details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Administrador',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/', // Define la ruta inicial
      routes: {
        '/': (context) => const RegisterScreen(),
        '/storeDetails': (context) =>
            const StoreDetailsScreen(), // Añade la ruta para la nueva pantalla
      },
    );
  }
}
