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
      initialRoute: '/',
      routes: {
        '/': (context) => const RegisterScreen(),
        '/storeDetails': (context) => const StoreDetailsScreen(),
      },
    );
  }
}
