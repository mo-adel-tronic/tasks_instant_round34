import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:r34_02/core/error/exceptions.dart';
import 'package:r34_02/core/network/api_provider.dart';

// This makes it easier to replace, mock, or extend later
//So We can later using firebase,...
class HttpProvider extends APIProvider {
  final http.Client client;

  HttpProvider({http.Client? client}) : client = client ?? http.Client();

  /// GET request
  @override
  Future<dynamic> get(String url) async {
    final response = await client.get(Uri.parse(url));
    return _processResponse(response);
  }

  /// POST request
  @override
  Future<dynamic> post(String url, {Map<String, dynamic>? body}) async {
    final response = await client.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'}, //other headers
      body: jsonEncode(body ?? {}),
    );
    return _processResponse(response);
  }

  /// PUT request
  @override
  Future<dynamic> put(String url, {Map<String, dynamic>? body}) async {
    final response = await client.put(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body ?? {}),
    );
    return _processResponse(response);
  }

  /// DELETE request
  @override
  Future<dynamic> delete(String url) async {
    final response = await client.delete(Uri.parse(url));
    return _processResponse(response);
  }

  // 🔹 Process response, throw exceptions if needed
  dynamic _processResponse(http.Response response) {
    final statusCode = response.statusCode;
    if (statusCode >= 200 && statusCode < 300) {
      if (response.body.isEmpty) return {};
      try {
        return jsonDecode(response.body); // JSON
      } catch (e) {
        return response.body; // plain text
      }
    } else {
      if (statusCode == 400) throw BadRequestException();
      if (statusCode == 401 || statusCode == 403) throw UnAuthorizedException();
      if (statusCode == 404) throw NotFoundException();

      throw ServerException();
    }
  }
}
