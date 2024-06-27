import 'package:administrador/screens/login_screens.dart';
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
                        _buildCard(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQaDhNdZIB_wdGKA0xLGWlwC1tdt5ZzjZIcgP9z6_3zuqc9_BzJKZ3PDLwMOVZSBH-We1k&usqp=CAU',
                            "Mi recibo"),
                        _buildCard(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRovXEDFjIrjjzujDfwO99Nnj5eSzVxHx0fAg&s',
                            "Total de Ordenes"),
                        _buildCard(
                            'https://w7.pngwing.com/pngs/145/382/png-transparent-chart-graph-database-computer-icons-statistics-graph-of-a-function-pratique-angle-text-graph-of-a-function.png',
                            "Estadistica"),
                      ],
                    ),
                    Column(
                      children: [
                        _buildCard(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPsZlmVRr_Angyha6aDbOrIPb_pv1smplOU_ZxJf-9m-hU90sH9CKjq8nn7RmQps0yacc&usqp=CAU',
                            "Help"),
                        _buildCard(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDs_421_GWlw2SPfOja0-Df6mOWFSOjmLwjg&s',
                            "Catalogo"),
                        _buildCard(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQtMMRK9NEDcJiFQeXzQ7NT4KsfqvyQ3A9HYg&s',
                            "Transacciones"),
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
                          MaterialPageRoute(
                              builder: (context) => HomeScreens(
                                    key: key,
                                  )));
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.crop_din_rounded),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreens()));
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
          ],
        ),
      ),
    );
  }

  Widget _buildCard(String imageUrl, texto) {
    return Card(
      margin: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            imageUrl,
            fit: BoxFit.cover,
            width: 120.0,
            height: 120.0,
          ),
          const SizedBox(height: 10.0), // Espacio entre la imagen y el texto
          Text(
            '$texto',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
