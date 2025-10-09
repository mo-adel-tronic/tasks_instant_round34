import 'package:r34_02/core/constants/url_constants.dart';
import 'package:r34_02/core/error/exceptions.dart';
import 'package:r34_02/core/network/api_provider.dart';
import 'package:r34_02/features/users/data/models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<List<UserModel>> getAllUsers();
  Future<UserModel> getUser(String id);
  Future<UserModel> createUser(UserModel model);
  Future<UserModel> updateUser(UserModel model);
  Future<bool> deleteUser(String id);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final APIProvider apiProvider;
  UserRemoteDataSourceImpl({required this.apiProvider});

  static const String _baseUrl =
      "${URLConstants.baseURL}${URLConstants.usersEndPoint}";

  @override
  Future<List<UserModel>> getAllUsers() async {
    try {
      final data = await apiProvider.get(_baseUrl);
      final List usersJson = data["users"] as List;
      return usersJson
          .map((json) => UserModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<UserModel> getUser(String id) async {
    try {
      final data = await apiProvider.get("$_baseUrl/$id");
      return UserModel.fromJson(data as Map<String, dynamic>);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<UserModel> createUser(UserModel model) async {
    try {
      final data = await apiProvider.post(
        "$_baseUrl/add",
        body: model.toJsonCreate(),
      );
      return UserModel.fromJson(data as Map<String, dynamic>);
    } on NotFoundException {
      throw NotFoundException();
    } on BadRequestException {
      throw BadRequestException();
    } on UnAuthorizedException {
      throw UnAuthorizedException();
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<UserModel> updateUser(UserModel model) async {
    try {
      final data = await apiProvider.put(
        "$_baseUrl/${model.id}",
        body: model.toJsonCreate(),
      );
      return UserModel.fromJson(data as Map<String, dynamic>);
    } on NotFoundException {
      throw NotFoundException();
    } on BadRequestException {
      throw BadRequestException();
    } on UnAuthorizedException {
      throw UnAuthorizedException();
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<bool> deleteUser(String id) async {
    try {
      await apiProvider.delete("$_baseUrl/$id");
      return true;
    } on NotFoundException {
      throw NotFoundException();
    } on BadRequestException {
      throw BadRequestException();
    } on UnAuthorizedException {
      throw UnAuthorizedException();
    } catch (e) {
      throw ServerException();
    }
  }
}
