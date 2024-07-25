import 'dart:convert';

import 'package:administrador/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int _selectedIndex = 0;
  final ApiService _apiService = ApiService();
  final ImagePicker _picker = ImagePicker();
  XFile? _image;

  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _precioController = TextEditingController();
  final TextEditingController _promocionController = TextEditingController();
  final TextEditingController _categoriaController = TextEditingController();
  final TextEditingController _descripcionController = TextEditingController();
  final TextEditingController _cantidadController = TextEditingController();

  List<dynamic> _productos = [];
  bool _isLoading = false;
  int? _editingProductId;

  @override
  void initState() {
    super.initState();
    _fetchProductos();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<void> _fetchProductos() async {
    setState(() {
      _isLoading = true;
    });

    try {
      List<dynamic> productos = await _apiService.getAllProductos();
      setState(() {
        _productos = productos;
      });
    } catch (e) {
      print('Error fetching products: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _loadProductData(Map<String, dynamic> product) {
    _nombreController.text = product['nombre_producto'];
    _precioController.text = product['precio'];
    _promocionController.text = product['precio_promocion'];
    _categoriaController.text = product['categoria'];
    _descripcionController.text = product['descripcion'];
    _cantidadController.text = product['cantidad'];
    _editingProductId = product['id'];
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
    if (_nombreController.text.isEmpty || _precioController.text.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: const Text('Nombre y Precio son campos obligatorios.'),
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
        'https://anboto-back-production-9c3a.up.railway.app/api/producto${_editingProductId != null ? '/$_editingProductId' : ''}');
    final response = await (_editingProductId != null
        ? http.put(
            url,
            headers: {'Content-Type': 'application/json'},
            body: json.encode({
              'nombre_producto': _nombreController.text,
              'precio': _precioController.text,
              'precio_promocion': _promocionController.text,
              'categoria': _categoriaController.text,
              'descripcion': _descripcionController.text,
              'cantidad': _cantidadController.text,
            }),
          )
        : http.post(
            url,
            headers: {'Content-Type': 'application/json'},
            body: json.encode({
              'nombre_producto': _nombreController.text,
              'precio': _precioController.text,
              'precio_promocion': _promocionController.text,
              'categoria': _categoriaController.text,
              'descripcion': _descripcionController.text,
              'cantidad': _cantidadController.text,
            }),
          ));

    if (response.statusCode == 201 || response.statusCode == 200) {
      _fetchProductos();
      _clearForm();
      _editingProductId = null;
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: const Text('Error al guardar el producto.'),
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

  Future<void> _deleteProducto(int? id) async {
    if (id == null) {
      print('Error: Producto ID es null');
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      await _apiService.deleteProducto(id.toString());
      _fetchProductos();
    } catch (e) {
      print('Error deleting product: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _clearForm() {
    _nombreController.clear();
    _precioController.clear();
    _promocionController.clear();
    _categoriaController.clear();
    _descripcionController.clear();
    _cantidadController.clear();
    _editingProductId = null;
  }

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
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  const Text(
                    'Nuevo producto',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Container(
                    color: Colors.grey[300],
                    height: 100,
                    width: 100,
                    child: Icon(Icons.image, size: 50, color: Colors.grey[600]),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          _selectedIndex == 0 ? Colors.white : Colors.grey[400],
                      foregroundColor:
                          _selectedIndex == 0 ? Colors.black : Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    onPressed: () => _onItemTapped(0),
                    child: const Text('Registro'),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          _selectedIndex == 1 ? Colors.white : Colors.grey[400],
                      foregroundColor:
                          _selectedIndex == 1 ? Colors.black : Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    onPressed: () => _onItemTapped(1),
                    child: const Text('Stock'),
                  ),
                ],
              ),
              Expanded(
                child: IndexedStack(
                  index: _selectedIndex,
                  children: [
                    _buildRegistroForm(),
                    _buildStockView(),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              _isLoading
                  ? const CircularProgressIndicator()
                  : Expanded(child: _buildProductList()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRegistroForm() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTextField('Nombre del producto', _nombreController),
            _buildTextField('Precio', _precioController),
            ExpansionTile(
              title: const Text(
                'Opciones',
                style: TextStyle(color: Colors.white),
              ),
              children: <Widget>[
                _buildTextField('Precio de promoción', _promocionController),
                _buildTextField('Categoría', _categoriaController),
                _buildTextField('Descripción', _descripcionController),
                _buildTextField('Cantidad', _cantidadController),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              onPressed: _submitForm,
              child: const Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStockView() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.inventory, size: 100, color: Colors.white),
            const SizedBox(height: 20),
            const Text(
              'Stock actual',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            const SizedBox(height: 10),
            const Text(
              '0',
              style: TextStyle(color: Colors.white, fontSize: 50),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              onPressed: () {},
              child: const Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductList() {
    return ListView.builder(
      itemCount: _productos.length,
      itemBuilder: (context, index) {
        final producto = _productos[index];
        return Card(
          child: ListTile(
            title: Text(producto['nombre_producto']),
            subtitle: Text(producto['precio'] ?? ''),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    _loadProductData(producto);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => _deleteProducto(producto['id']),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.white),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10.0),
          ),
          filled: true,
          fillColor: Colors.white.withOpacity(0.1),
        ),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
