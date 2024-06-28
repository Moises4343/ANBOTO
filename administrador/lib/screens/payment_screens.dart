import 'package:flutter/material.dart';

class PaymentScreens extends StatelessWidget {
  const PaymentScreens({super.key});

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
                      _buildStatusButton(context, 'Pagar', true), // Estado por defecto
                      _buildConnector(true),
                      _buildStatusButton(context, 'Confirmar', false),
                    ],
                  ),
                ],
              ),
            ),
            Center(
             child: Container(
            padding: const EdgeInsets.all(20.0),
            child: const Text(
              'Agregar tarjeta de crédito o débito\nSus datos de pago se almacenan de forma segura.Al agregar una tarjeta, no se le cobrará todavía.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.center,
            ),)
            ),
            const SizedBox(height: 16),
             Padding( padding: const EdgeInsets.symmetric(horizontal: 20),child:ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.network(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiqPuTIk30djexm6bNVggzxomfDTv5mW-Gfg&s',
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),),
           const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Nombre encima del TextField
                const Text(
                  'Numero de la tarjeta',
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
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: Colors.white, width: 2.0),
                    color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.1), // Ajusta la opacidad aquí
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: '0000000000000000',
                      hintStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none, // Quita el borde del TextField
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
  padding: const EdgeInsets.symmetric(horizontal: 20),
  child: Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Nombre encima del TextField 1
            const Text(
              'Fecha de caducidad',
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
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Colors.white, width: 2.0),
                color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.1),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'MM/YYY',
                  hintStyle: TextStyle(color: Colors.white),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
      const SizedBox(width: 20), // Espacio entre los dos elementos
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Nombre encima del TextField 2
            const Text(
              'CVV',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8), // Espacio entre el nombre y el TextField

            // Container con TextField 2
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Colors.white, width: 2.0),
                color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.1),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: '1234',
                  hintStyle: TextStyle(color: Colors.white),
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
const SizedBox(width: 20),
Padding(
  padding: const EdgeInsets.symmetric(horizontal: 20),
  child:Row(
      children: [
        const Expanded(
          child: Text(
            'Guarda esta tarjeta para la próxima vez',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        Switch(
          value: true, // Cambia este valor según tu lógica
          onChanged: (bool newValue) {
            // Implementa aquí la lógica que desees cuando cambie el Switch
          },
        ),
      ],
    ),),
const SizedBox(width: 20),
Padding(
  padding: const EdgeInsets.symmetric(horizontal: 20),
  child:Row(
      children: [
        const Expanded(
          child: Text(
            'Hacer de esta mi tarjeta predeterminada',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        Switch(
          value: true, // Cambia este valor según tu lógica
          onChanged: (bool newValue) {
            // Implementa aquí la lógica que desees cuando cambie el Switch
          },
        ),
      ],
    ),),
const SizedBox(height: 40),
          Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white, // color de fondo blanco
            disabledBackgroundColor: Colors.black, // color del texto negro
          ),
          onPressed: () {
            // acción al presionar el botón
          },
          child: const Text('Siguiente'),
        ),
      ),            
          ],
        ),
      ),
    );
  }

  Widget _buildStatusButton(BuildContext context, String text, bool isSelected) {
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