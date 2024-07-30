// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers, library_private_types_in_public_api, file_names

import 'package:administrador/screens/home_screens.dart';
import 'package:administrador/screens/login_screens.dart';
import 'package:flutter/material.dart';

class ReceiptPaymentScreen extends StatefulWidget {
  const ReceiptPaymentScreen({super.key});

  @override
  _MireciboState createState() => _MireciboState();
}

class _MireciboState extends State<ReceiptPaymentScreen> {
  bool _switchValue = true;

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

            // Lista sin color de fondo
            Container(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: screenHeight * 0.1,
                    color: const Color.fromARGB(255, 179, 179, 179),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomeScreens(),
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                        SizedBox(width: screenHeight * 0.1),
                        const Text(
                          'Configurar mi recibo',
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: screenHeight * 0.1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: screenHeight * 0.1),
                        const Text(
                          'Datos de la Tienda',
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: screenHeight * 0.1),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomeScreens(),
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.arrow_forward_ios,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(color: Color.fromARGB(255, 255, 255, 255)),
                  Container(
                    width: double.infinity,
                    height: screenHeight * 0.3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(width: 3),
                            const Text(
                              'Datos de la Tienda',
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: screenHeight * 0.1),
                            SwitchTheme(
                              data: SwitchThemeData(
                                trackColor: WidgetStateProperty.all(
                                    const Color.fromARGB(0, 255, 255, 255)),
                                trackOutlineColor:
                                    WidgetStateProperty.all(Colors.white),
                                thumbColor:
                                    WidgetStateProperty.resolveWith(
                                        (states) {
                                  if (states.contains(WidgetState.selected)) {
                                    return Colors.white;
                                  }
                                  return Colors.white;
                                }),
                                overlayColor:
                                    WidgetStateProperty.all(Colors.transparent),
                                splashRadius: 0,
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: Switch(
                                value: _switchValue,
                                onChanged: (value) {
                                  setState(() {
                                    _switchValue = value;
                                  });
                                },
                              ),
                            ),
                            const SizedBox(width: 3),
                          ],
                        ),
                        Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(width:3),
                        const Text(
                          'Datos de la Tienda',
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: screenHeight * 0.1),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomeScreens(),
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.question_mark_outlined,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                        const SizedBox(width:3),
                      ],
                    ),
                      ],
                    ),
                  ),
                  const Divider(color: Color.fromARGB(255, 255, 255, 255)),
                  SizedBox(height: screenHeight*0.1,),
                    Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const LoginScreens()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 86, 86, 86), // background (button) color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12), // Cambia este valor para ajustar el radio del borde
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.remove_red_eye_outlined, // Cambia esto por el ícono que desees
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                            SizedBox(width: 8), // Espacio entre el ícono y el texto
                            Text(
                              'Sign up',
                              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenWidth*0.1,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const LoginScreens()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 253, 253, 253), // background (button) color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10), // Cambia este valor para ajustar el radio del borde
                          ),
                        ),
                        child: const Text(
                          'Sign up',
                          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Pie de página
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
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.person),
                      onPressed: () {},
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

