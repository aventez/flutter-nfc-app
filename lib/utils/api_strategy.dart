import 'dart:io';
import 'package:http/http.dart' as http;

class ApiStrategy {
  static final String apiUrl = "https://backend-bkk7j.ondigitalocean.app";

  final String token;

  ApiStrategy(this.token);

  Future<String> get(String path) async {
    final response = await http.get(
      '$apiUrl/$path',
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
    );

    return response.body;
  }

  Future<String> delete(String path) async {
    final response = await http.delete(
      '$apiUrl/$path',
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
    );

    return response.body;
  }

  Future<String> post(String path) async {
    // TODO: form data
    final response = await http.post(
      '$apiUrl/$path',
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
    );

    return response.body;
  }

  Future<String> put(String path) async {
    // TODO: form data
    final response = await http.put(
      '$apiUrl/$path',
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
    );

    return response.body;
  }
}
