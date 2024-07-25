import 'dart:convert';
import 'dart:io';

import 'package:administrador/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class StoreDetailsScreen extends StatefulWidget {
  const StoreDetailsScreen({super.key});

  @override
  StoreDetailsScreenState createState() => StoreDetailsScreenState();
}

class StoreDetailsScreenState extends State<StoreDetailsScreen> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _complementController = TextEditingController();
  List<dynamic> _stores = [];
  bool _isLoading = false;
  int? _editingStoreId;

  @override
  void initState() {
    super.initState();
    _fetchStores();
  }

  Future<void> _fetchStores() async {
    setState(() {
      _isLoading = true;
    });

    ApiService apiService = ApiService();
    try {
      List<dynamic> stores = await apiService.getAllDatosTienda();
      setState(() {
        _stores = stores;
      });
    } catch (e) {
      print('Error fetching stores: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _loadStoreData(Map<String, dynamic> store) {
    _nameController.text = store['nombre_comercio'];
    _phoneController.text = store['telefono'];
    _addressController.text = store['direccion'];
    _complementController.text = store['complemento'];
    _editingStoreId = store['id_tienda'];
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
      print('Error al seleccionar la imagen: $e');
    }
  }

  Future<void> _submitForm() async {
    if (_nameController.text.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: const Text('El nombre del comercio es obligatorio.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    final url = Uri.parse(
        'https://anboto-back-production-9c3a.up.railway.app/api/datos_tienda${_editingStoreId != null ? '/$_editingStoreId' : ''}');
    final response = await (_editingStoreId != null
        ? http.put(
            url,
            headers: {'Content-Type': 'application/json'},
            body: json.encode({
              'nombre_comercio': _nameController.text,
              'telefono': _phoneController.text,
              'direccion': _addressController.text,
              'complemento': _complementController.text,
            }),
          )
        : http.post(
            url,
            headers: {'Content-Type': 'application/json'},
            body: json.encode({
              'nombre_comercio': _nameController.text,
              'telefono': _phoneController.text,
              'direccion': _addressController.text,
              'complemento': _complementController.text,
            }),
          ));

    if (response.statusCode == 201 || response.statusCode == 200) {
      _fetchStores();
      _nameController.clear();
      _phoneController.clear();
      _addressController.clear();
      _complementController.clear();
      _editingStoreId = null;
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: const Text('Error al guardar los datos de la tienda.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }

    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _deleteStore(int id) async {
    setState(() {
      _isLoading = true;
    });

    ApiService apiService = ApiService();
    try {
      await apiService.deleteDatosTienda(id.toString());
      _fetchStores();
    } catch (e) {
      print('Error deleting store: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

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
                onTap: _pickImage,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: _image == null
                      ? const Icon(Icons.add_photo_alternate,
                          size: 50, color: Colors.deepPurple)
                      : Image.file(File(_image!.path),
                          width: 100, height: 100, fit: BoxFit.cover),
                ),
              ),
              const SizedBox(height: 40),
              _buildTextField(context, 'Nombre del comercio', _nameController,
                  Colors.white),
              const SizedBox(height: 30),
              _buildTextField(context, 'Telefono (opcional)', _phoneController,
                  Colors.white,
                  icon: Icons.phone),
              const SizedBox(height: 30),
              _buildTextField(context, 'Dirección (opcional)',
                  _addressController, Colors.white),
              const SizedBox(height: 30),
              _buildTextField(context, 'Complemento (opcional)',
                  _complementController, Colors.white),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                  textStyle: const TextStyle(fontSize: 18),
                ),
                child: const Text('Guardar',
                    style: TextStyle(color: Colors.white)),
              ),
              const SizedBox(height: 20),
              _isLoading
                  ? const CircularProgressIndicator()
                  : _buildStoreList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(BuildContext context, String label,
      TextEditingController controller, Color fillColor,
      {IconData? icon}) {
    return TextFormField(
      controller: controller,
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

  Widget _buildStoreList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _stores.length,
      itemBuilder: (context, index) {
        final store = _stores[index];
        return Card(
          child: ListTile(
            title: Text(store['nombre_comercio']),
            subtitle: Text(store['telefono'] ?? ''),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    _loadStoreData(store);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => _deleteStore(store['id_tienda']),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
