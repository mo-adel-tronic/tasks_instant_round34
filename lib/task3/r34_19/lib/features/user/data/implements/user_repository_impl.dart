import '../../domain/entity/user.dart';
import '../../domain/repository/user_repository.dart';
import '../model/user_model.dart';
import '../sources/user_local_source.dart';
class UserRepositoryImpl implements UserRepository {
  final UserLocalSource localSource;
  UserRepositoryImpl(this.localSource);
  @override
  Future<User> getUserById(String id) async {
    final all = await localSource.getCachedUsers();
    return all.firstWhere((e) => e.id == id, orElse: () => UserModel(id: id, name: 'Unknown'));
  }
  @override
  Future<List<User>> getUsers() async {
    final list = await localSource.getCachedUsers();
    if(list.isEmpty){
      // seed with sample data
      final seed = [UserModel(id: '1', name: 'Alice'), UserModel(id: '2', name: 'Bob')];
      await localSource.cacheUsers(seed);
      return seed;
    }
    return list;
  }
}
