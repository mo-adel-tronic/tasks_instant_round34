import 'package:r34_23/core/error/exceptions.dart';
import 'package:r34_23/features/users/data/models/user_model.dart';

abstract class UserRemoteDataSource {
  List<UserModel> getAllUsers();
  UserModel getUser(String id);
  UserModel createUser(UserModel user);
  UserModel updateUser(UserModel user);
  bool deleteUser(String id);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final List<UserModel> _users = [
    const UserModel(id: "1", name: "Mahmoud", email: "Mahmoud227@gmail.com"),
    const UserModel(id: "2", name: "Masry", email: "Masry334@gmail.com"),
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
      throw Serverexception();
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
      throw Serverexception();
    }
  }

  @override
  bool deleteUser(String id) {
    final initialLength = _users.length;
    _users.removeWhere((user) => user.id == id);
    return _users.length < initialLength;
  }
}