import 'package:administrador/screens/home_screens.dart';
import 'package:administrador/screens/login_screens.dart';
import 'package:administrador/screens/setting_screen.dart';
import 'package:flutter/material.dart';

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenHeight = screenSize.height;
    double screenWidth = screenSize.width;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            // Fondo con gradiente
            Container(
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
            ),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  top: screenHeight * 0.15,
                  bottom: screenHeight * 0.1,
                ),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: screenWidth * 0.15,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: screenWidth * 0.14,
                        backgroundImage: const AssetImage('assets/perfil.jpg'),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    const Text(
                      'Julia Guillen Borraz',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'Julia@gmail.com',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    const Text(
                      'Restablecer contraseña',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16.0,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    const ProfileOption(
                      text: 'Datos de la tienda',
                    ),
                    const ProfileOption(
                      text: 'Plan actual: Plus',
                    ),
                    const ProfileOption(
                      text: 'Borrar datos personales',
                    ),
                    const ProfileOption(
                      text: 'Cerrar sesión',
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
            ),
            // Pie de página
            Align(
              alignment: Alignment.bottomCenter,
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
                        MaterialPageRoute(
                            builder: (context) => const PerfilScreen()),
                      );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileOption extends StatelessWidget {
  final String text;
  final Color color;

  const ProfileOption({
    super.key,
    required this.text,
    this.color = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
