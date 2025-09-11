import 'package:r34_12/core/error/exceptions.dart';
import '../models/user_model.dart';

abstract class UserRemoteDataSource {
  UserModel addUser(UserModel user);
  UserModel updateUser(UserModel user);
  bool deleteUser(String id);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final List<UserModel> _users = [
    const UserModel(id: '1', name: 'User 1', email: 'user1@example.com'),
    const UserModel(id: '2', name: 'User 2', email: 'user2@example.com'),
  ];

  @override
  UserModel addUser(UserModel user) {
    _users.add(user);
    return user;
  }

  @override
  UserModel updateUser(UserModel user) {
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
    _users.removeWhere((u) => u.id == id);
    return _users.length < initialLength;
  }
}