import '../repository/user_repository.dart';
import '../entity/user.dart';
class GetUsers {
  final UserRepository repository;
  GetUsers(this.repository);
  Future<List<User>> call() async => await repository.getUsers();
}
