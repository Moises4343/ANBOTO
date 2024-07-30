// ignore_for_file: camel_case_types, sized_box_for_whitespace, file_names, must_be_immutable
import 'package:administrador/screens/home_screens.dart';
import 'package:administrador/screens/login_screens.dart';
import 'package:flutter/material.dart';

class TotalOrdersScreen extends StatelessWidget {
  TotalOrdersScreen({super.key});
  List lista = [
    "",
    "Selecionar uno o mas ...",
    "Todos los estados",
    "Pendiente",
    "Confirmar",
    "Esperando el pago",
    "Pago",
    "En producion"
  ];
  List iconos = [const Icon(Icons.cancel_outlined),const Icon(Icons.cancel_outlined,color: Color.fromRGBO(255, 255, 255, 1),),const Icon(Icons.ev_station_rounded,color: Color.fromRGBO(255, 255, 255, 1),),const Icon(Icons.restart_alt,color: Color.fromRGBO(255, 255, 255, 1),),const Icon(Icons.library_add_check,color: Color.fromRGBO(255, 255, 255, 1),),const Icon(Icons.payment,color: Color.fromRGBO(255, 255, 255, 1),),const Icon(Icons.payment_sharp,color: Color.fromRGBO(255, 255, 255, 1),),const Icon(Icons.add_box_outlined,color: Color.fromRGBO(255, 255, 255, 1),)];

  @override
  Widget build(BuildContext context) {
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
              margin: const EdgeInsets.only(
                  top: 50), // Ajusta el margen según sea necesario
              child: ListView(
                children: List.generate(7, (index) {
                  return ListTile(
                    title: Text(
                      lista[index + 1],
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    trailing: iconos[index + 1],
                    onTap: () {
                      // Acción al hacer clic en un elemento de la lista
                    },
                  );
                }),
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
