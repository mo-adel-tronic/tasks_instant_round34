import 'package:task3/core/error/exceptions.dart';
import 'package:task3/features/user/data/models/user_model.dart';

abstract class UserRemoteDataSource {
  List<UsersModel> getAllUser();
  UsersModel getUser(String id);
  UsersModel createUser(UsersModel user);
  UsersModel updateUser(UsersModel user);
  bool deleteUser(String id);
}

class UserRemoteDatasourceImp implements UserRemoteDataSource {
  final List<UsersModel> _users = [
    UsersModel(id: '1', name: 'Mahmoud', email: 'Mahmoud@gmail.com'),
    UsersModel(id: '2', name: 'Kroush', email: 'Kroush@gmail.com')
  ];

  @override
  List<UsersModel> getAllUser() {
    return _users;
  }

  @override
  UsersModel getUser(String id) {
    try {
      return _users.firstWhere((user) => user.id == id);
    } catch (e) {
      throw ServerException();
    }
  }
  
  @override
  UsersModel createUser(UsersModel user) {
    final newUser = user.copywith(id: DateTime.now().microsecondsSinceEpoch.toString());
    _users.add(newUser);
    return newUser;
  }

  @override
  UsersModel updateUser(UsersModel user) {
    final index = _users.indexWhere((u) => u.id == user.id);
    if (index != -1) {
      _users[index] = user;
      return user;
    } else {
      throw ServerException();
    }
  }
  
  @override
  bool deleteUser(String id) {
    final initialLength = _users.length;
    _users.removeWhere((user) => user.id == id);
    return _users.length < initialLength;
  }
  
}