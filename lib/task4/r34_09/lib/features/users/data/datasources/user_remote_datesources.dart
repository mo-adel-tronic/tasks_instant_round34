import 'dart:convert';
import 'package:task7/core/error/exceptions.dart';
import 'package:task7/core/network/api_provider.dart';
import 'package:task7/core/constants/url.dart';
import 'package:task7/features/users/data/models/users_model.dart';

abstract class UserRemoteDatesources {
  Future<List<UsersModel>> getAllUser();
  Future<UsersModel> getUser(String id);
  Future<UsersModel> createUser(UsersModel user);
  Future<UsersModel> updateUser(UsersModel user);
  Future<bool> deleteUser(String id);
}

class UserRemoteDatesourcesImbl implements UserRemoteDatesources {
  final ApiProvider apiProvider;
  static const _baseUrl = URLconstants.baseURL + URLconstants.usersEndpoint;

  UserRemoteDatesourcesImbl({required this.apiProvider});

  @override
  Future<List<UsersModel>> getAllUser() async {
    try {
      final response = await apiProvider.get('$_baseUrl?limit=100');
      final Map<String, dynamic> data =
          response is String ? jsonDecode(response) : response;

      final List usersJson = data['users'] as List;
      return usersJson
          .map((u) => UsersModel.fromJson(u as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print("Error in getAllUser: $e");
      throw ServerException();
    }
  }

  @override
  Future<UsersModel> getUser(String id) async {
    try {
      final response = await apiProvider.get('$_baseUrl/$id');
      final Map<String, dynamic> data =
          response is String ? jsonDecode(response) : response;

      return UsersModel.fromJson(data);
    } catch (e) {
      print("Error in getUser: $e");
      throw ServerException();
    }
  }

  @override
  Future<UsersModel> createUser(UsersModel user) async {
    try {
      final body = user.toJsonForCreate();

      final response = await apiProvider.post(
        '$_baseUrl/add',
        body: body,
      );

      final Map<String, dynamic> data =
          response is String ? jsonDecode(response) : response;

      return UsersModel.fromJson(data);
    } catch (e) {
      print("Create User Error: $e");
      throw ServerException();
    }
  }

  @override
  Future<UsersModel> updateUser(UsersModel user) async {
    try {
      final response =
          await apiProvider.put('$_baseUrl/${user.id}', body: user.toJson());
      final Map<String, dynamic> data =
          response is String ? jsonDecode(response) : response;

      return UsersModel.fromJson(data);
    } catch (e) {
      print("Error in updateUser: $e");
      throw ServerException();
    }
  }

  @override
  Future<bool> deleteUser(String id) async {
    try {
      await apiProvider.delete('$_baseUrl/$id');
      return true;
    } catch (e) {
      print("Error in deleteUser: $e");
      throw ServerException();
    }
  }
}
