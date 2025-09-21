import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_provider.dart';

class HttpProvider implements ApiProvider {
  final String baseUrl = "https://jsonplaceholder.typicode.com"; 

  @override
  Future<dynamic> get(String url) async {
    final response = await http.get(Uri.parse('$baseUrl$url'));
    return _processResponse(response);
  }

  @override
  Future<dynamic> post(String url, {Map<String, dynamic>? body}) async {
    final response = await http.post(
      Uri.parse('$baseUrl$url'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );
    return _processResponse(response);
  }

  @override
  Future<dynamic> put(String url, {Map<String, dynamic>? body}) async {
    final response = await http.put(
      Uri.parse('$baseUrl$url'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );
    return _processResponse(response);
  }

  @override
  Future<dynamic> delete(String url) async {
    final response = await http.delete(Uri.parse('$baseUrl$url'));
    return _processResponse(response);
  }

  dynamic _processResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Error: ${response.statusCode}');
    }
  }
}
