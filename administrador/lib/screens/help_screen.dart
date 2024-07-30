import 'package:administrador/screens/home_screens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  _AyudaState createState() => _AyudaState();
}

class _AyudaState extends State<HelpScreen> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenHeight = screenSize.height;
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
              scrollDirection:Axis.vertical,
              
              child:Padding(padding: EdgeInsets.only(top: 40 ),child:  Column(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0, top: 40.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => const HomeScreens()));
                                  },
                                  icon: const Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.white,
                                  )),
                              SizedBox(width: screenHeight * 0.1),
                              const Text(
                                'Ayuda',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Center(
                              child: Icon(
                                CupertinoIcons.person,
                                size: 100,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text(
                              '¿En qué podemos ayudarte?',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          // Campo de búsqueda
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: '¿Qué deseas buscar?',
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                prefixIcon: const Icon(Icons.search),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          // Botones de opciones
                          OptionButton(
                            icon: Icons.shopping_cart,
                            text: 'Problemas con el pedido',
                            onPressed: () {},
                          ),
                          OptionButton(
                            icon: Icons.list_alt,
                            text: 'Gestión de pedidos',
                            onPressed: () {},
                          ),
                          OptionButton(
                            icon: Icons.payment,
                            text: 'Gestión de pagos',
                            onPressed: () {},
                          ),
                          OptionButton(
                            icon: Icons.account_circle,
                            text: 'Gestión de cuenta y perfil',
                            onPressed: () {},
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'Otras Búsquedas',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          OptionButton(
                            icon: Icons.delete,
                            text: 'Eliminar la información guardada',
                            onPressed: () {},
                          ),
                          OptionButton(
                            icon: Icons.share,
                            text: 'Cómo compartir mi catálogo',
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                   SizedBox(height: screenHeight*0.3 ,),
                ],
              ),)
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
                        // Aquí deberías reemplazar MiPantalla con la pantalla correcta
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreens()), // Cambia esto según sea necesario
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

class OptionButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;

  const OptionButton({
    super.key,
    required this.icon,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton.icon(
          onPressed: onPressed,
          icon: Icon(icon, color: const Color.fromARGB(255, 0, 0, 0)),
          label: Text(text, style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      ),
    );
  }
}
