import 'package:administrador/screens/home_screens.dart';
import 'package:administrador/screens/planes_screens.dart';
import 'package:administrador/screens/stactic_screens.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
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
          // Contenido de la pantalla
          Column(
            children: [
              // Espacio arriba (puede ser un SizedBox)
              const SizedBox(height: 40),
              // Input con icono de búsqueda
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const TextField(
                          decoration: InputDecoration(
                            hintText: 'Buscar...',
                            border: InputBorder.none,
                            icon: Icon(Icons.search),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    // Icono de más para agregar
                    const Icon(Icons.add, color: Colors.white, size: 30),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SizedBox(
                  height: screenHeight * 0.1,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey,
                          ),
                          child: const Text(
                            'Press me',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(width: 5), // Agregar espacio entre botones
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey,
                          ),
                          child: const Text(
                            'Press me',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(width: 5), // Agregar espacio entre botones
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey,
                          ),
                          child: const Text(
                            'Press me',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Cards de imágenes y texto en formato de tablero (GridView)
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // Número de columnas en el tablero
                    crossAxisSpacing:
                        10.0, // Espacio horizontal entre elementos
                    mainAxisSpacing: 10.0, // Espacio vertical entre elementos
                    childAspectRatio:
                        1.2, // Relación entre ancho y alto de cada card
                  ),
                  itemCount:
                      6, // Número de elementos (puedes ajustar según necesites)
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: 100,
                      height: 100,
                      child: Card(
                        elevation: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(4)),
                                child: Image.network(
                                  'https://www.monchys.com/cdn/shop/files/Chocolate3leches_rebanada.jpg?v=1689093604&width=1946', // URL de la imagen
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Card $index',
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold)),
                                  const SizedBox(height: 2),
                                  Text('Descripción de la card $index',
                                      style: const TextStyle(fontSize: 10)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          // Barra de navegación como pie de página
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomeScreens(key: key)));
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.crop_din_rounded),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.settings),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => StatisticsScreens(key: key,)));
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.person),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => PlanesScreens(key: key,)));
                    },
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
