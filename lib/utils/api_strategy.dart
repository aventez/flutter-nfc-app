import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiStrategy {
  static final String apiUrl = "https://backend-2-kmri8.ondigitalocean.app/api";

  final String token;

  ApiStrategy(this.token);

  Future<Response> get(String path) async {
    final response = await http.get(
      '$apiUrl/$path',
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
    );

    return response;
  }

  Future<Response> delete(String path) async {
    final response = await http.delete(
      '$apiUrl/$path',
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
    );

    return response;
  }

  Future<Response> post(String path, Map<String, dynamic> data) async {
    final response = await http.post(
      '$apiUrl/$path',
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
      body: json.encode(data),
    );

    return response;
  }
}
