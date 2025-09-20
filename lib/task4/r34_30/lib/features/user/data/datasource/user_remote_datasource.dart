import 'package:r34_30/core/constants/url.dart';
import 'package:r34_30/core/error/exceptions.dart';
import 'package:r34_30/core/network/api_provider.dart';
import 'package:r34_30/features/user/data/models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<List<UsersModel>> getAllUser();
  Future<UsersModel> getUser(String id);
  Future<UsersModel> createUser(UsersModel user);
  Future<UsersModel> updateUser(UsersModel user);
  Future<bool> deleteUser(String id);
}

class UserRemoteDatasourceImp implements UserRemoteDataSource {
  final ApiProvider apiProvider;
  static const _baseUrl = UrlConstants.baseUrl + UrlConstants.usersEndPoint;

  UserRemoteDatasourceImp({required this.apiProvider});

  @override
  Future<List<UsersModel>> getAllUser() async {
    try {
      final json = await apiProvider.get('$_baseUrl?limit=30');
      final List usersJson = json['users'] as List;
      return usersJson
          .map((u) => UsersModel.fromJson(u as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<UsersModel> getUser(String id) async {
    try {
      final json = await apiProvider.get('$_baseUrl/$id');
      return UsersModel.fromJson(json as Map<String, dynamic>);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<UsersModel> createUser(UsersModel user) async {
    try {
      final body = user.toJsonForCreate();
      final json = await apiProvider.post('$_baseUrl/add', body: body);
      return UsersModel.fromJson(json as Map<String, dynamic>);
    } on NotFoundException {
      throw NotFoundException();
    } on BadRequestException {
      throw BadRequestException();
    } on UnauthorizedException {
      throw UnauthorizedException();
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<UsersModel> updateUser(UsersModel user) async {
    try {
      final body = user.tojson();
      final json = await apiProvider.put('$_baseUrl/${user.id}', body: body);
      return UsersModel.fromJson(json as Map<String, dynamic>);
    } on NotFoundException {
      throw NotFoundException();
    } on BadRequestException {
      throw BadRequestException();
    } on UnauthorizedException {
      throw UnauthorizedException();
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<bool> deleteUser(String id) async {
    try {
      await apiProvider.delete('$_baseUrl/$id');
      return true;
    } on NotFoundException {
      throw NotFoundException();
    } on BadRequestException {
      throw BadRequestException();
    } on UnauthorizedException {
      throw UnauthorizedException();
    } catch (e) {
      throw ServerException();
    }
  }
}
