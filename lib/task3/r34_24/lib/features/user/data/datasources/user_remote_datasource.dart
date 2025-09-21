import 'package:r34_24/core/error/exception.dart';
import '../models/user_model.dart';

abstract class UserRemoteDatasource {
  List<UserModel> getAllUsers();
  UserModel getUser(String id);
  UserModel createUser(UserModel user);
  UserModel updateUser(UserModel user);
  bool deleteUser(String id);
}

class UserRemoteDatasourceImpl implements UserRemoteDatasource {
  final List<UserModel> _users = [
    const UserModel(id: '1', name: 'Sara', email: 'sara@email.com'),
    const UserModel(id: '2', name: 'Omar', email: 'omar@email.com'),
  ];

  @override
  List<UserModel> getAllUsers() => _users;

  @override
  UserModel getUser(String id) {
    try {
      return _users.firstWhere((user) => user.id == id);
    } catch (_) {
      throw ServerException();
    }
  }

  @override
  UserModel createUser(UserModel user) {
    final newUser = user.copyWith(id: DateTime.now().millisecondsSinceEpoch.toString());
    _users.add(newUser);
    return newUser;
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
    _users.removeWhere((user) => user.id == id);
    return _users.length < initialLength;
  }
}
