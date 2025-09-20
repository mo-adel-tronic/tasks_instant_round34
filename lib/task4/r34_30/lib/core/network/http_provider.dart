import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:r34_30/core/error/exceptions.dart';
import 'package:r34_30/core/network/api_provider.dart';

class HttpProvider implements ApiProvider {
  final http.Client client;

  HttpProvider({http.Client? client}) : client = client ?? http.Client();

  Future<dynamic> get(String url) async {
    final response = await client.get(Uri.parse(url));
    return _processResponse(response);
  }

  @override
  Future<dynamic> post(String url, {Map<String, dynamic>? body}) async {
    final response = await client.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(body ?? {}),
    );
    return _processResponse(response);
  }

  @override
  Future<dynamic> put(String url, {Map<String, dynamic>? body}) async {
    final response = await client.put(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(body ?? {}),
    );
    return _processResponse(response);
  }

  Future<dynamic> delete(String url) async {
    final response = await client.delete(Uri.parse(url));
    return _processResponse(response);
  }

  Future<dynamic> _processResponse(http.Response response) async {
    final statusCode = response.statusCode;
    if (statusCode >= 200 && statusCode < 300) {
      if (response.body.isNotEmpty) return null;
      try {
        return json.decode(response.body);
      } catch (e) {
        throw response.body;
      }
    } else {
      if (statusCode == 400) throw BadRequestException();
      if (statusCode == 401 || statusCode == 403) throw UnauthorizedException();
      if (statusCode == 404) throw NotFoundException();
      throw ServerException();
    }
  }
}
