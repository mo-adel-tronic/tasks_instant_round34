import 'package:r34_22/core/error/exceptions.dart';
import 'package:r34_22/features/user/data/models/user_model.dart';

abstract class UserRemoteDataSource {
  List<UserModel> getAllUsers();
  UserModel getUser(String id);
  UserModel createUser(UserModel user);
  UserModel updateUser(UserModel user);
  bool deleteUser(String id);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final List<UserModel> _users = [
    const UserModel(id: "1", name: "User 1", email: "user1@email.com"),
    const UserModel(id: "2", name: "User 2", email: "user2@email.com"),
  ];

  @override
  List<UserModel> getAllUsers() {
    return _users;
  }

  @override
  UserModel getUser(String id) {
    try {
      return _users.firstWhere((user) => user.id == id);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  UserModel createUser(UserModel user) {
    final newUser = user.copywith(id: DateTime.now().millisecondsSinceEpoch.toString());
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