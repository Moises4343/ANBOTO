// ignore_for_file: sized_box_for_whitespace
import 'package:administrador/screens/login_screens.dart';
import 'package:flutter/material.dart';

class RegisterScreens extends StatelessWidget {
  const RegisterScreens({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: const Color(0xFF4E304C), // Color de fondo de la vista
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: screenHeight * 0.2, // Responsive height
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 153, 94, 149),
                    borderRadius:  BorderRadius.vertical(bottom:Radius.circular(50) ),
                  ),
                  child: const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "create account",
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                        Text(
                          "fill your information",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                        Text(
                          "below",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Nombre encima del TextField
                      const Text(
                        'Name',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16, // Ajusta el tamaño del nombre según lo necesites
                          fontWeight: FontWeight.bold, // Opcional, ajusta el peso de la fuente
                        ),
                      ),
                      const SizedBox(height: 8), // Espacio entre el nombre y el TextField

                      // Container con TextField
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40.0),
                          border: Border.all(color: Colors.white, width: 2.0),
                          color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.1), // Ajusta la opacidad aquí
                        ),
                        child: const TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none, // Quita el borde del TextField
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            // Nombre encima del TextField 1
                            const Text(
                              'Number',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8), // Espacio entre el nombre y el TextField

                            // Container con TextField 1
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40.0),
                                border: Border.all(color: Colors.white, width: 2.0),
                                color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.1),
                              ),
                              child: const TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.05), // Espacio entre los dos elementos
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const SizedBox(height: 35), // Espacio entre el nombre y el TextField

                            // Container con TextField 2
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40.0),
                                border: Border.all(color: Colors.white, width: 2.0),
                                color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.1),
                              ),
                              child: const TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Nombre encima del TextField
                      const Text(
                        'Email',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16, // Ajusta el tamaño del nombre según lo necesites
                          fontWeight: FontWeight.bold, // Opcional, ajusta el peso de la fuente
                        ),
                      ),
                      const SizedBox(height: 8), // Espacio entre el nombre y el TextField

                      // Container con TextField
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40.0),
                          border: Border.all(color: Colors.white, width: 2.0),
                          color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.1), // Ajusta la opacidad aquí
                        ),
                        child: const TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none, // Quita el borde del TextField
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Nombre encima del TextField
                      const Text(
                        'Password',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16, // Ajusta el tamaño del nombre según lo necesites
                          fontWeight: FontWeight.bold, // Opcional, ajusta el peso de la fuente
                        ),
                      ),
                      const SizedBox(height: 8), // Espacio entre el nombre y el TextField

                      // Container con TextField e Icono
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40.0),
                          border: Border.all(color: Colors.white, width: 2.0),
                          color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.1), // Ajusta la opacidad aquí
                        ),
                        child: const Row(
                          children: [
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none, // Quita el borde del TextField
                                ),
                              ),
                            ),
                            Icon(
                              Icons.visibility, // Cambia el ícono según lo necesites
                              color: Colors.white, // Ajusta el color del ícono
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Nombre encima del TextField
                      const Text(
                        'Date',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16, // Ajusta el tamaño del nombre según lo necesites
                          fontWeight: FontWeight.bold, // Opcional, ajusta el peso de la fuente
                        ),
                      ),
                      const SizedBox(height: 8), // Espacio entre el nombre y el TextField

                      // Container con TextField
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40.0),
                          border: Border.all(color: Colors.white, width: 2.0),
                          color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.1), // Ajusta la opacidad aquí
                        ),
                        child: const TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none, // Quita el borde del TextField
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                  child: Row(
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: (bool? value) {},
                      ),
                      const Text(
                        'Agregar wit',
                        style: TextStyle(color: Color.fromARGB(255, 255, 254, 254)),
                      ),
                      const Spacer(),
                      const Text(
                        'Terminate of condition',
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          decoration: TextDecoration.underline,
                          decorationColor: Color.fromARGB(255, 255, 255, 255), // Color del subrayado
                          decorationThickness: 2.0,
                        ),
                      ),
                    ],
                  ),
                ),
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
        ),
      ),
    );
  }
}
