import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https://anboto-back-production.up.railway.app/api/";

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
}