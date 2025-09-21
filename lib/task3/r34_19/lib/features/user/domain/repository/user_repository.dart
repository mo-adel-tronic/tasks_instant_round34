import '../entity/user.dart';
abstract class UserRepository {
  Future<List<User>> getUsers();
  Future<User> getUserById(String id);
}
