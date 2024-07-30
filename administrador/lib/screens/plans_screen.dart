import 'package:administrador/screens/payment_screens.dart';
import 'package:flutter/material.dart';


class CustomGradientBackground extends StatelessWidget {
  const CustomGradientBackground({super.key});

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
            // Espacio para la barra de estado (puede ser un contenedor con altura específica)
            Container(
              height: MediaQuery.of(context).padding.top,
              color: Colors.transparent,
            ),
            // Espacio para la línea de estados y conectores
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  // Línea horizontal que conecta los estados
                  // Fila con los estados
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildStatusButton(context, 'Detalles', false),
                      _buildConnector(true),
                      _buildStatusButton(
                          context, 'Pagar', true), // Estado por defecto
                      _buildConnector(true),
                      _buildStatusButton(context, 'Confirmar', false),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcThjRH66nq1Q-bBv50LUaLPOYpbOFvAalBJFQ&s',
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, // Para separar extremo a extremo
                children: [
                  Text(
                    'Basico',
                    style: TextStyle(color: Colors.white), // Color blanco
                  ),
                  Text(
                    '169.00',
                    style: TextStyle(color: Colors.white), // Color blanco
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, // Para separar extremo a extremo
                children: [
                  Text(
                    '3 meses',
                    style: TextStyle(color: Colors.white), // Color blanco
                  ),
                  Text(
                    '200.00',
                    style: TextStyle(color: Colors.white), // Color blanco
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                height: 2.0,
                color: Colors.white, // Color de la línea blanca
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, // Para separar extremo a extremo
                children: [
                  Text(
                    'Subtotal',
                    style: TextStyle(color: Colors.white), // Color blanco
                  ),
                  Text(
                    '169.00',
                    style: TextStyle(color: Colors.white), // Color blanco
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, // Para separar extremo a extremo
                children: [
                  Text(
                    'Descuento',
                    style: TextStyle(color: Colors.white), // Color blanco
                  ),
                  Text(
                    '200.00',
                    style: TextStyle(color: Colors.white), // Color blanco
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                height: 2.0,
                color: Colors.white, // Color de la línea blanca
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, // Para separar extremo a extremo
                children: [
                  Text(
                    'Total',
                    style: TextStyle(color: Colors.white), // Color blanco
                  ),
                  Text(
                    '169.00',
                    style: TextStyle(color: Colors.white), // Color blanco
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Colors.white, width: 2.0),
                      color: const Color.fromARGB(255, 255, 255, 255)
                          .withOpacity(0.1), // ajusta la opacidad aquí
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: 'Nombre',
                        hintStyle: TextStyle(color: Colors.white),
                        border:
                            InputBorder.none, // quita el borde del TextField
                      ),
                    ),
                  ),
                )),
            const SizedBox(height: 20),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Colors.white, width: 2.0),
                      color: const Color.fromARGB(255, 255, 255, 255)
                          .withOpacity(0.1), // ajusta la opacidad aquí
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: 'Ciudad',
                        hintStyle: TextStyle(color: Colors.white),
                        border:
                            InputBorder.none, // quita el borde del TextField
                      ),
                    ),
                  ),
                )),
            const SizedBox(height: 20),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Colors.white, width: 2.0),
                      color: const Color.fromARGB(255, 255, 255, 255)
                          .withOpacity(0.1), // ajusta la opacidad aquí
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: 'Codigo postal',
                        hintStyle: TextStyle(color: Colors.white),
                        border:
                            InputBorder.none, // quita el borde del TextField
                      ),
                    ),
                  ),
                )),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // color de fondo blanco
                  disabledBackgroundColor:
                      Colors.black, // color del texto negro
                ),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => const PaymentScreens()));
                },
                child: const Text('Siguiente'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusButton(
      BuildContext context, String text, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.black : Colors.white,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  Widget _buildConnector(bool isActive) {
    return Container(
      width: 30.0,
      height: 2.0,
      color: isActive ? Colors.white : Colors.grey.withOpacity(0.5),
    );
  }
}
