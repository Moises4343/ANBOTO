// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors_in_immutables

import 'package:administrador/screens/home_screens.dart';
import 'package:administrador/screens/login_screens.dart';
import 'package:administrador/screens/perfil_screen.dart';
import 'package:administrador/screens/setting_screen.dart';
import 'package:flutter/material.dart';

class PaidFilterScreen extends StatefulWidget {
  PaidFilterScreen({super.key});

  @override
  _FiltroFechaPageState createState() => _FiltroFechaPageState();
}

class _FiltroFechaPageState extends State<PaidFilterScreen> {
  bool efectivo = false;
  bool debito = false;
  bool credito = false;
  bool otros = false;

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home:     Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFBF79A7),
                Color(0xFF945A7D),
                Color(0xFF6C3E55),
                Color(0xFF4D273A),
              ],
              stops: [0.0, 0.31, 0.62, 1.0],
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
                              padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.close, color: Colors.white),
                        onPressed: () {
                          // Acción para el botón de cerrar
                        },
                      ),
                      const Text(
                        'Filtro de fecha',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Ingrese los siguientes campos',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    onPressed: () {},
                    child: const Text('Fecha de inicio'),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    onPressed: () {},
                    child: const Text('Fecha final'),
                  ),
                  const SizedBox(height: 20),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    alignment: WrapAlignment.center,
                    children: [
                      _buildFilterButton('Hoy'),
                      _buildFilterButton('Ayer'),
                      _buildFilterButton('Esta semana'),
                      _buildFilterButton('Semana pasada'),
                      _buildFilterButton('Este mes'),
                      _buildFilterButton('Mes pasado'),
                      _buildFilterButton('Este año'),
                      _buildFilterButton('El año pasado'),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Medio de pago',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  _buildCheckbox('Efectivo', efectivo, (bool? value) {
                    setState(() {
                      efectivo = value ?? false;
                    });
                  }),
                  _buildCheckbox('Debito', debito, (bool? value) {
                    setState(() {
                      debito = value ?? false;
                    });
                  }),
                  _buildCheckbox('Crédito', credito, (bool? value) {
                    setState(() {
                      credito = value ?? false;
                    });
                  }),
                  _buildCheckbox('Otros', otros, (bool? value) {
                    setState(() {
                      otros = value ?? false;
                    });
                  }),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    onPressed: () {},
                    child: const Text('Aplicar filtros'),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
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
                  icon: const Icon(Icons.crop_din_rounded),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreens()),
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
                      MaterialPageRoute(builder: (context) => const PerfilScreen()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    )),
    );
  }

  Widget _buildFilterButton(String text) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      onPressed: () {
        // Acción del botón de filtro
      },
      child: Text(text),
    );
  }

  Widget _buildCheckbox(String title, bool value, Function(bool?) onChanged) {
    return CheckboxListTile(
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      value: value,
      onChanged: onChanged,
      controlAffinity: ListTileControlAffinity.leading,
      activeColor: Colors.white,
      checkColor: Colors.black,
    );
  }
}
