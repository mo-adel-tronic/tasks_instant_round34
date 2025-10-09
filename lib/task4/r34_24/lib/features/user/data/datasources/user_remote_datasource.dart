
import 'package:r34_24/core/error/exception.dart';
import 'package:r34_24/core/network/api_provider.dart';
import '../models/user_model.dart';

abstract class UserRemoteDatasource {
  Future<List<UserModel>> getAllUsers();
  Future<UserModel> getUser(String id);
  Future<UserModel> createUser(UserModel user);
  Future<UserModel> updateUser(UserModel user);
  Future<bool> deleteUser(String id);
}

class UserRemoteDatasourceImpl implements UserRemoteDatasource {
  final ApiProvider apiProvider;
  static const String baseUrl = 'https://dummyjson.com/users';

  UserRemoteDatasourceImpl({required this.apiProvider});

  @override
  Future<List<UserModel>> getAllUsers() async {
    try {
      final json = await apiProvider.get('$baseUrl?limit=30');
      final List usersJson = json['users'] as List;
      return usersJson.map((user) => UserModel.fromJson(user as Map<String, dynamic>)).toList();
    } catch (e) {
      print('Error in getAllUsers: $e');
      throw ServerException();
    }
  }

  @override
  Future<UserModel> getUser(String id) async {
    try {
      final json = await apiProvider.get('$baseUrl/$id');
      return UserModel.fromJson(json as Map<String, dynamic>);
    } on BadRequestException {
      throw BadRequestException();
    } on UnauthorizedException {
      throw UnauthorizedException();
    } on NotFoundException {
      throw NotFoundException();
    } catch (e) {
      print('Error in getUser: $e');
      throw ServerException();
    }
  }

  @override
  Future<UserModel> createUser(UserModel user) async {
    try {
      final body = user.toJson();
      print('Creating user with payload: $body'); // Debug payload
      final json = await apiProvider.post(baseUrl, body: body);
      print('API response: $json'); 
      return UserModel.fromJson(json as Map<String, dynamic>);
    } on BadRequestException {
      print('BadRequestException in createUser');
      throw BadRequestException();
    } on UnauthorizedException {
      print('UnauthorizedException in createUser');
      throw UnauthorizedException();
    } catch (e) {
      print('Error in createUser: $e');
      throw ServerException();
    }
  }

  @override
  Future<UserModel> updateUser(UserModel user) async {
    try {
      final body = user.toJson();
      print('Updating user with payload: $body'); // Debug payload
      final json = await apiProvider.put('$baseUrl/${user.id}', body: body);
      print('API response: $json'); // Debug response
      return UserModel.fromJson(json as Map<String, dynamic>);
    } on BadRequestException {
      print('BadRequestException in updateUser');
      throw BadRequestException();
    } on UnauthorizedException {
      print('UnauthorizedException in updateUser');
      throw UnauthorizedException();
    } on NotFoundException {
      print('NotFoundException in updateUser');
      throw NotFoundException();
    } catch (e) {
      print('Error in updateUser: $e');
      throw ServerException();
    }
  }

  @override
  Future<bool> deleteUser(String id) async {
    try {
      final response = await apiProvider.delete('$baseUrl/$id');
      print('Delete response: $response'); // Debug response
      return true;
    } on NotFoundException {
      print('NotFoundException in deleteUser');
      return false;
    } on BadRequestException {
      print('BadRequestException in deleteUser');
      throw BadRequestException();
    } on UnauthorizedException {
      print('UnauthorizedException in deleteUser');
      throw UnauthorizedException();
    } catch (e) {
      print('Error in deleteUser: $e');
      throw ServerException();
    }
  }
}