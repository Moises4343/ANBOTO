import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // Asegúrate de que el paquete está importado

class StoreDetailsScreen extends StatefulWidget {
  const StoreDetailsScreen({super.key});

  @override
  _StoreDetailsScreenState createState() => _StoreDetailsScreenState();
}

class _StoreDetailsScreenState extends State<StoreDetailsScreen> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image; // Variable para almacenar la imagen seleccionada

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[400],
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Datos de la tienda',
            style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              GestureDetector(
                onTap:
                    _pickImage, // Llama a la función para seleccionar la imagen
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: _image ==
                          null // Muestra la imagen seleccionada o el ícono por defecto
                      ? const Icon(Icons.add_photo_alternate,
                          size: 50, color: Colors.deepPurple)
                      : Image.file(File(_image!.path),
                          width: 100, height: 100, fit: BoxFit.cover),
                ),
              ),
              const SizedBox(height: 40),
              _buildTextField(context, 'Nombre del comercio', Colors.white),
              const SizedBox(height: 30),
              _buildTextField(context, 'Telefono (opcional)', Colors.white,
                  icon: Icons.phone),
              const SizedBox(height: 30),
              _buildTextField(context, 'Dirección (opcional)', Colors.white),
              const SizedBox(height: 30),
              _buildTextField(context, 'Complemento (opcional)', Colors.white),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                  textStyle: const TextStyle(fontSize: 18),
                ),
                child: const Text('Guardar',
                    style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _pickImage() async {
    try {
      final XFile? selectedImage =
          await _picker.pickImage(source: ImageSource.gallery);
      if (selectedImage != null) {
        setState(() {
          _image = selectedImage;
        });
      }
    } catch (e) {
      // Manejo de errores o mostrar una alerta si ocurre algún error
      print('Error al seleccionar la imagen: $e');
    }
  }

  Widget _buildTextField(BuildContext context, String label, Color fillColor,
      {IconData? icon}) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.deepPurple),
        fillColor: fillColor,
        filled: true,
        prefixIcon: icon != null ? Icon(icon, color: Colors.deepPurple) : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.deepPurple),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.deepPurple[300]!, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.deepPurple, width: 2),
        ),
      ),
    );
  }
}
