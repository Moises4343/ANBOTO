// ignore_for_file: avoid_print

import 'package:administrador/screens/help_screen.dart';
import 'package:administrador/screens/login_screens.dart';
import 'package:administrador/screens/new_product_screens.dart';
import 'package:administrador/screens/perfil_screen.dart';
import 'package:administrador/screens/setting_screen.dart';
import 'package:administrador/screens/stactic_screens.dart';
import 'package:administrador/screens/subscription_screen.dart';
import 'package:administrador/screens/total_orders_screen.dart';
import 'package:administrador/screens/transactions_screen.dart';
import 'package:flutter/material.dart';

class HomeScreens extends StatelessWidget {
  const HomeScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFC17EBD),
              Color(0xFF9B6198),
              Color(0xFF754472),
              Color(0xFF4E304C),
            ],
            stops: [0.0, 0.31, 0.62, 1.0],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'HOME',
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        _buildCard('assets/dinero.jpeg', "Mi recibo", () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>  const ReceiptPage()));
                        }),
                        _buildCard('assets/box.jpeg', "Total de Ordenes", () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>  TotalOrdersScreen()));
                        }),
                        _buildCard('assets/estadisticas.jpeg', "Estadistica",
                            () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const StacticScreens()),
                          );
                        }),
                      ],
                    ),
                    Column(
                      children: [
                        _buildCard('assets/help.jpeg', "Help", () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HelpScreen()),
                          );
                          
                        }),
                        _buildCard('assets/book.jpeg', "Catalogo", () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SubscriptionScreen()),
                          );
                        }),
                        _buildCard('assets/buy.jpeg', "Transacciones", () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const TransactionsScreen()),
                          );
                        }),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 6,
                    offset: const Offset(0, -3),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: const Icon(Icons.grid_view),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const HomeScreens()),
                      );
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProductPage()),
                      );
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.settings),
                    onPressed: () {
                                            Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SettingScreen()),
                      );
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.person),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PerfilScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(String imageUrl, String texto, void Function()? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imageUrl,
              fit: BoxFit.cover,
              width: 120.0,
              height: 120.0,
            ),
            const SizedBox(height: 10.0), // Espacio entre la imagen y el texto
            Text(
              texto,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
