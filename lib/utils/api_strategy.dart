import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';

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

  Future<Response> uploadFile(String path, String filepath) async {
    var request = http.MultipartRequest('POST', Uri.parse('$apiUrl/$path'));
    request.headers['authorization'] = 'Bearer $token';
    request.files.add(
      await http.MultipartFile.fromPath(
        'file',
        filepath,
        contentType: MediaType('image', 'jpeg'),
      ),
    );

    final response = http.Response.fromStream(await request.send());
    return response;
  }

  Uri getApiUri(String path) {
    return Uri.parse('$apiUrl/$path');
  }
}
