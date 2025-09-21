import 'package:r34_12/core/constants/url.dart';
import 'package:r34_12/core/error/exceptions.dart';
import 'package:r34_12/core/network/api_provider.dart';
import 'package:r34_12/features/users/domain/usecases/get_all_users.dart';
import 'package:r34_12/features/users/domain/usecases/update_user.dart';
import '../models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<List<UserModel>> getAllUsers();
  Future<UserModel> getUser(String id);
  Future<UserModel> createUser(UserModel pser);
  Future<UserModel> updateUser(UserModel pser);
  Future<bool> deleteUser(String id);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final ApiProvider apiProvider;
  static const _baseUrl = URLConstants.baseUrl + URLConstants.usersEndpoint;
  
  UserRemoteDataSourceImpl({required this.apiProvider});
  
  @override
  Future<List<UserModel>> getAllUsers() async{
    try {
      final json = await apiProvider.get('$_baseUrl');

      final List usersjson = json['users'] as List;
      return usersjson.map((p) => UserModel.fromJson(p as Map<String, dynamic>)).toList();

    } catch(e){
      throw ServerException();
    }
  }

  @override
  Future<UserModel> getUser(String id) async{
    try{
      final json = await apiProvider.get('$_baseUrl/$id');
      return UserModel.fromJson(json as Map<String, dynamic>);
    }catch(e){
      throw ServerException();
    }
  }


  @override
  Future<UserModel> createUser(UserModel user) async{
    try{
      final body = user.toJsonForCreate();
      final json = await apiProvider.post('$_baseUrl/add',body:body);
      return UserModel.fromJson(json as Map<String, dynamic>);
    }on NotFoundException{
      throw NotFoundException();
    }on BadRequestException{
      throw BadRequestException();
    }on UnauthorizedException{
      throw UnauthorizedException();
    }catch(e){

      throw ServerException();
    }
  }


  @override
  Future<UserModel> updateUser(UserModel user) async{
    try{
      final body = user.toJson();
      final json = await apiProvider.put('$_baseUrl/${user.id}',body:body);
      return UserModel.fromJson(json as Map<String, dynamic>);
    }on NotFoundException{
      throw NotFoundException();
    }on BadRequestException{
      throw BadRequestException();
    }on UnauthorizedException{
      throw UnauthorizedException();
    }catch(e){

      throw ServerException();
    }
  }



  

  @override
  Future<bool> deleteUser(String id) async{
    try{
     await apiProvider.delete('$_baseUrl/$id');
     return true;
     
    }on NotFoundException{
      throw NotFoundException();
    }on BadRequestException{
      throw BadRequestException();
    }on UnauthorizedException{
      throw UnauthorizedException();
    }catch(e){

      throw ServerException();
    }
  }
  
  
  
  
}