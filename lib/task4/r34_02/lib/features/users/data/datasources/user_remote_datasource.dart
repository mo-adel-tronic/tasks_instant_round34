import 'package:r34_02/core/error/exceptions.dart';
import 'package:r34_02/features/users/data/models/user_model.dart';

abstract class UserRemoteDataSource {
  List<UserModel> getAllUsers();
  UserModel getUser(String id);
  UserModel createUser(UserModel model);
  UserModel updateUser(UserModel model);
  bool deleteUser(String id);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final List<UserModel> _users = [
    UserModel(id: "1", name: "p1", email: "test@test.com", gender: "male"),
    UserModel(id: "2", name: "p2", email: "test@test.com", gender: "female"),
    UserModel(id: "3", name: "p3", email: "test@test.com", gender: "male"),
    UserModel(id: "4", name: "p4", email: "test@test.com", gender: "female"),
    UserModel(id: "5", name: "p5", email: "test@test.com", gender: "male"),
  ];

  @override
  List<UserModel> getAllUsers() {
    return _users;
  }

  @override
  UserModel getUser(String id) {
    try {
      return _users.firstWhere((p) => p.id == id); //or use orElse
    } catch (e) {
      throw ServerException(); //Your exception
    }
  }

  @override
  UserModel createUser(UserModel model) {
    /*create new User with data:
     newId = DateTime.now()..
     newemail = model.email
    */
    final UserModel newUser = model.copyWith(
      newId: DateTime.now().microsecondsSinceEpoch.toString(),
    );
    _users.add(newUser);
    return newUser;
  }

  @override
  UserModel updateUser(UserModel model) {
    final int userIndex = _users.indexWhere((p) => p.id == model.id);
    if (userIndex != -1) {
      _users[userIndex] = model; //update data
      return model;
    } else {
      throw ServerException();
    }
  }

  @override
  bool deleteUser(String id) {
    final oldLength = _users.length;
    _users.removeWhere((p) => id == p.id);
    return _users.length < oldLength;
  }
}
