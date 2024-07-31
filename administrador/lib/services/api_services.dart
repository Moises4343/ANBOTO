import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl =
      "https://anboto-back-production-9c3a.up.railway.app/api/";

  // Fetch all users
  Future<dynamic> getAllUsuariosAdmin() async {
    return fetchData('usuario_admin');
  }

  // Fetch single user by ID
  Future<dynamic> getUsuarioAdminById(String id) async {
    return fetchData('usuario_admin/$id');
  }

  // Create new user
  Future<dynamic> createUsuarioAdmin(Map<String, dynamic> data) async {
    return postData('usuario_admin', data);
  }

  // Update existing user
  Future<dynamic> updateUsuarioAdmin(
      String id, Map<String, dynamic> data) async {
    return putData('usuario_admin/$id', data);
  }

  // Delete user
  Future<dynamic> deleteUsuarioAdmin(String id) async {
    return deleteData('usuario_admin/$id');
  }

  // Fetch all store data
  Future<dynamic> getAllDatosTienda() async {
    return fetchData('datos_tienda');
  }

  // Fetch single store data by ID
  Future<dynamic> getDatosTiendaById(String id) async {
    return fetchData('datos_tienda/$id');
  }

  // Create new store data
  Future<dynamic> createDatosTienda(Map<String, dynamic> data) async {
    return postData('datos_tienda', data);
  }

  // Update store data
  Future<dynamic> updateDatosTienda(
      String id, Map<String, dynamic> data) async {
    return putData('datos_tienda/$id', data);
  }

  // Delete store data
  Future<dynamic> deleteDatosTienda(String id) async {
    return deleteData('datos_tienda/$id');
  }

  // Fetch all products
  Future<dynamic> getAllProductos() async {
    return fetchData('producto');
  }

  // Fetch single product by ID
  Future<dynamic> getProductoById(String id) async {
    return fetchData('producto/$id');
  }

  // Create new product
  Future<dynamic> createProducto(Map<String, dynamic> data) async {
    return postData('producto', data);
  }

  // Update existing product
  Future<dynamic> updateProducto(String id, Map<String, dynamic> data) async {
    return putData('producto/$id', data);
  }

  // Delete product
  Future<dynamic> deleteProducto(String id) async {
    return deleteData('producto/$id');
  }

  // Fetch all opinions
  Future<dynamic> getAllOpinions() async {
    return fetchData('opinion');
  }

// Fetch single opinion by ID
  Future<dynamic> getOpinionById(String id) async {
    return fetchData('opinion/$id');
  }

// Create new opinion
  Future<dynamic> createOpinion(Map<String, dynamic> data) async {
    return postData('opinion', data);
  }

// Update existing opinion
  Future<dynamic> updateOpinion(String id, Map<String, dynamic> data) async {
    return putData('opinion/$id', data);
  }

// Delete opinion
  Future<dynamic> deleteOpinion(String id) async {
    return deleteData('opinion/$id');
  }

  // Generic fetch data method
  Future<dynamic> fetchData(String endpoint) async {
    final response = await http.get(Uri.parse(baseUrl + endpoint));
    return _processResponse(response);
  }

  // Generic post data method
  Future<dynamic> postData(String endpoint, Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse(baseUrl + endpoint),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data),
    );
    return _processResponse(response);
  }

  // Generic put data method
  Future<dynamic> putData(String endpoint, Map<String, dynamic> data) async {
    final response = await http.put(
      Uri.parse(baseUrl + endpoint),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data),
    );
    return _processResponse(response);
  }

  // Generic delete data method
  Future<dynamic> deleteData(String endpoint) async {
    final response = await http.delete(Uri.parse(baseUrl + endpoint));
    return _processResponse(response);
  }

  // Process HTTP response
  dynamic _processResponse(http.Response response) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to process request: ${response.statusCode}');
    }
  }

  // Login method
  Future<bool> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('${baseUrl}usuario_admin/login'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        // Aquí puedes manejar la lógica post-login, como guardar tokens, etc.
        return true;
      } else {
        return false;
      }
    } catch (e) {
      // Manejo de errores de conexión o de otro tipo
      print('Error during login: $e');
      return false;
    }
  }
}
