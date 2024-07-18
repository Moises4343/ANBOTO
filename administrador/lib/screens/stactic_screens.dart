import 'dart:ui';

import 'package:administrador/screens/home_screens.dart';
import 'package:administrador/screens/login_screens.dart';
import 'package:flutter/material.dart';

class StacticScreens extends StatelessWidget {
  const StacticScreens({super.key});

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
              child: Column(
                children: [
                  const Center(
                    child: Padding(
                        padding: EdgeInsets.only(left: 16.0),
                        child: Column(
                          children: [
                            Text(
                              'Estadísticas',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 16.0),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 35.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.insert_chart,
                                    color: Colors.white,
                                    size: 36.0,
                                  ),
                                  SizedBox(width: 16.0),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Semanas',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18.0,
                                        ),
                                      ),
                                      Text(
                                        '5000',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 24.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 32.0),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Mensuales',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18.0,
                                        ),
                                      ),
                                      Text(
                                        '22650',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 24.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: Container(
                      height: 75, // Altura del rectángulo del título
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                            15.0), // Radio del borde circular
                        border: Border.all(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'Estadísticas Mensuales',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Center(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 40.0),
                                  child: Container(
                                    width: 300,
                                    height:
                                        100, // Altura del contenedor principal (ajústalo según sea necesario)
                                    padding: EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(
                                          15.0), // Radio del borde circular
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              width: 50,
                                              height: 50,
                                              decoration: const BoxDecoration(
                                                color: Colors.green,
                                                shape: BoxShape.circle,
                                              ),
                                              child: const Icon(Icons.arrow_downward,
                                                  color: Colors.white),
                                            ),
                                            const SizedBox(width: 12),
                                            const Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '25000',
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                ),
                                                Text(
                                                  'Ingresos',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.grey),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(width: 12),
                                            Container(
                                              width: 50,
                                              height: 50,
                                              decoration: const BoxDecoration(
                                                color: Colors.yellow,
                                                shape: BoxShape.circle,
                                              ),
                                              child: const Icon(
                                                  Icons.arrow_upward,
                                                  color: Colors.white),
                                            ),
                                            const SizedBox(width: 12),
                                            const Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '2300',
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                ),
                                                Text(
                                                  'Gastos',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.grey),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40.0),
                          child: Container(
                            height: 100, // Altura de la gráfica de barras
                            width: double.infinity,
                            child: CustomPaint(
                              painter:
                                  BarChartPainter(), // Define un CustomPainter para la gráfica
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        Center(
                          child: Container(
                            height: 75, // Altura del rectángulo del título
                            width: 200,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                  15.0), // Radio del borde circular
                              border: Border.all(
                                color: Colors.grey,
                                width: 1.0,
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                'Estadísticas semanales',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        Center(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 40.0),
                                  child: Container(
                                    width: 300,
                                    height:
                                        100, // Altura del contenedor principal (ajústalo según sea necesario)
                                    padding: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(
                                          15.0), // Radio del borde circular
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              width: 50,
                                              height: 50,
                                              decoration: const BoxDecoration(
                                                color: Colors.green,
                                                shape: BoxShape.circle,
                                              ),
                                              child: const Icon(Icons.arrow_downward,
                                                  color: Colors.white),
                                            ),
                                            const SizedBox(width: 12),
                                            const Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '25000',
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                ),
                                                Text(
                                                  'Ingresos',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.grey),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(width: 12),
                                            Container(
                                              width: 50,
                                              height: 50,
                                              decoration: const BoxDecoration(
                                                color: Colors.yellow,
                                                shape: BoxShape.circle,
                                              ),
                                              child: const Icon(
                                                  Icons.arrow_upward,
                                                  color: Colors.white),
                                            ),
                                            const SizedBox(width: 12),
                                            const Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '2300',
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                ),
                                                Text(
                                                  'Gastos',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.grey),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40.0),
                          child: Container(
                            height: 100, // Altura de la gráfica de barras
                            width: double.infinity,
                            child: CustomPaint(
                              painter:
                                  BarChartPainter(), // Define un CustomPainter para la gráfica
                            ),
                          ),
                        ),
                      ],
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
                      offset: const  Offset(0, -3),
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
                          MaterialPageRoute(builder: (context) => Home()),
                        );
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.crop_din_rounded),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginScreens(key: key,)),
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

class BarChartPainter extends CustomPainter {
  final List<double> data = [
    1.2,
    3.4,
    2.5,
    4.7
  ]; // Datos para las barras (dos por cada elemento)
  final List<String> labels = [
    "Semana 1",
    "Semana 2",
    "Semana 3",
    "Semana 4"
  ]; // Etiquetas para las barras
  final List<double> dottedLines = [
    1.0,
    2.0,
    3.0,
    4.0
  ]; // Niveles para las líneas punteadas

  @override
  void paint(Canvas canvas, Size size) {
    double maxValue =
        data.reduce((value, element) => value > element ? value : element);
    double barWidth =
        size.width / (data.length * 2); // Ancho de cada par de barras
    double maxBarHeight = size.height * 0.7; // Altura máxima de la barra
    double barSpacing = barWidth / 4; // Espacio entre barras dentro de un par

    // Define los colores alternados para las barras
    List<Color> barColors = [Colors.yellow, Colors.green];

    // Dibuja las barras
    for (int i = 0; i < data.length; i++) {
      for (int j = 0; j < 2; j++) {
        // Dos barras por cada dato
        double barHeight = (data[i] / maxValue) * maxBarHeight;
        double x = i * barWidth * 2 + j * barWidth + barWidth / 2;
        double y = size.height - barHeight;

        Paint paint = Paint()
          ..color = barColors[j]
          ..style = PaintingStyle.fill;

        canvas.drawRect(
          Rect.fromLTRB(
              x - barWidth / 2, y, x + barWidth / 2 - barSpacing, size.height),
          paint,
        );

        // Dibuja la etiqueta debajo de cada par de barras
        TextPainter textPainter = TextPainter(
          text: TextSpan(
            text: labels[i],
            style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255), fontSize: 12),
          ),
          textDirection: TextDirection.ltr,
          textAlign: TextAlign.center,
        );
        textPainter.layout();
        textPainter.paint(
            canvas,
            Offset(
                x - textPainter.width / 2, size.height - textPainter.height));
      }
    }

    // Dibuja las líneas punteadas para los niveles alcanzados
    Paint dottedLinePaint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    for (int i = 0; i < dottedLines.length; i++) {
      double y = size.height - (dottedLines[i] / maxValue) * maxBarHeight;

      Path dottedLinePath = Path();
      dottedLinePath.moveTo(0, y);
      dottedLinePath.lineTo(size.width, y);

      canvas.drawPath(
        _createDashedPath(dottedLinePath),
        dottedLinePaint,
      );
    }
  }

  // Función para crear el efecto de línea punteada
  Path _createDashedPath(Path originalPath) {
    Path dashedPath = Path();
    for (PathMetric pathMetric in originalPath.computeMetrics()) {
      for (double i = 0; i < pathMetric.length; i += 5) {
        double start = i;
        double end = i + 2.5;
        dashedPath.addPath(pathMetric.extractPath(start, end), Offset.zero);
      }
    }
    return dashedPath;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
