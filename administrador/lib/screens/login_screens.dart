import 'package:flutter/material.dart';
//import 'package:administrador/pages/home.dart';
//import 'package:administrador/pages/estadisticas.dart';
//import 'package:administrador/pages/planes.dart';

class MiPantalla extends StatelessWidget {
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
          // Contenido de la pantalla
          Column(
            children: [
              // Espacio arriba (puede ser un SizedBox)
              SizedBox(height: 40),
              // Input con icono de búsqueda
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Buscar...',
                            border: InputBorder.none,
                            icon: Icon(Icons.search),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    // Icono de más para agregar
                    Icon(Icons.add, color: Colors.white, size: 30),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: SizedBox(
                  height: screenHeight * 0.1,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey,
                        ),
                        child: Text(
                          'Press me',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey,
                          ),
                          child: Text(
                            'Press me',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey,
                        ),
                        child: Text(
                          'Press me',
                          style: TextStyle(color: Colors.white),
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
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(4)),
                                child: Image.network(
                                  'data:image/jpeg;base64,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', // URL de la imagen
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Card $index',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(height: 2),
                                  Text('Descripción de la card $index',
                                      style: TextStyle(fontSize: 10)),
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
                    offset: Offset(0, -3),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: Icon(Icons.grid_view),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Home()));
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.crop_din_rounded),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.settings),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => estadistica()));
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.person),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  CustomGradientBackground()));
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
