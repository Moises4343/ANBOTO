// ignore_for_file: sized_box_for_whitespace

import 'package:administrador/screens/home_screens.dart';
import 'package:administrador/screens/register_screens.dart';
import 'package:flutter/material.dart';

class MiPantalla extends StatelessWidget {
  const MiPantalla({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;

    return Scaffold(
      body: Stack(
        children: [
          // Fondo con gradiente lineal
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
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: screenWidth * 0.9,
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: screenHeight * 0.2,
                          child: Image.asset('assets/app_logo.jpeg'),
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Email',
                            hintStyle: const TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0)),
                            prefixIcon: const Icon(Icons.email,
                                color: Color.fromARGB(255, 0, 0, 0)),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: const BorderSide(
                                color: Color(0xFF9B6198),
                                width: 2,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color(0xFF9B6198),
                                width: 2,
                              ),
                            ),
                          ),
                          style: const TextStyle(color: Colors.black),
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Password',
                            hintStyle: const TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0)),
                            prefixIcon: const Icon(Icons.password,
                                color: Color.fromARGB(255, 0, 0, 0)),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: const BorderSide(
                                color: Color(0xFF9B6198),
                                width: 2,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color(0xFF9B6198),
                                width: 2,
                              ),
                            ),
                          ),
                          style: const TextStyle(color: Colors.black),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: false,
                                  onChanged: (bool? value) {},
                                ),
                                const Text(
                                  'Remember me',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                            const Text(
                              'forgot password',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 90, 156, 255)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Container(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Home()));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(
                                  0xFF4E304C), // background (button) color
                            ),
                            child: const Text('Sign ln',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255))),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Logos de Google, Facebook y Apple
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 20,
                        child: Image.asset('assets/google_logo.png'),
                      ),
                      const SizedBox(width: 10),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 20,
                        child: Image.asset('assets/facebook_logo.png'),
                      ),
                      const SizedBox(width: 10),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 20,
                        child: Image.asset('assets/apple_logo.png'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Texto debajo de los logos
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Dont have an?',
                        style: TextStyle(fontSize: 16, color: Colors.blue),
                      ),
                      SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Registro()));
                        },
                        child: const Text(
                          'Sign up here',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
