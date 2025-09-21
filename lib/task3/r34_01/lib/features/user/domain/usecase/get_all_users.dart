import 'package:dartz/dartz.dart';
import 'package:r34_01/core/error/failures.dart';
import '../entity/user_entity.dart';
import '../repository/user_repository.dart';

class GetAllUsers {
  final UserRepository repo;
  GetAllUsers(this.repo);

  Either<Failure, List<User>> call() {
    return repo.getAllUsers();
  }
}