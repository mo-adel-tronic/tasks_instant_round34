import '../model/user_model.dart';
abstract class UserLocalSource {
  Future<List<UserModel>> getCachedUsers();
  Future<void> cacheUsers(List<UserModel> users);
}
