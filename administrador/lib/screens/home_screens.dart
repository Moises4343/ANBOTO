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
                        _buildCard('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQaDhNdZIB_wdGKA0xLGWlwC1tdt5ZzjZIcgP9z6_3zuqc9_BzJKZ3PDLwMOVZSBH-We1k&usqp=CAU',"Mi recibo"),
                        _buildCard('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRovXEDFjIrjjzujDfwO99Nnj5eSzVxHx0fAg&s',"Total de Ordenes"),
                        _buildCard('data:image/png;base64,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',"Estadistica"),
                      ],
                    ),
                    Column(
                      children: [
                        _buildCard('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPsZlmVRr_Angyha6aDbOrIPb_pv1smplOU_ZxJf-9m-hU90sH9CKjq8nn7RmQps0yacc&usqp=CAU',"Help"),
                        _buildCard('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDs_421_GWlw2SPfOja0-Df6mOWFSOjmLwjg&s',"Catalogo"),
                        _buildCard('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQtMMRK9NEDcJiFQeXzQ7NT4KsfqvyQ3A9HYg&s',"Transacciones"),
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
                          Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomeScreens(key: key,)));
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.crop_din_rounded),
                    onPressed: () {
                          Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginScreen(key: key,)));
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

  Widget _buildCard(String imageUrl,texto) {
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
