import '../model/user_model.dart';
import '../sources/user_local_source.dart';
class UserLocalSourceImpl implements UserLocalSource {
  final List<UserModel> _store = [];
  @override
  Future<void> cacheUsers(List<UserModel> users) async {
    _store.clear();
    _store.addAll(users);
  }
  @override
  Future<List<UserModel>> getCachedUsers() async => _store;
}
