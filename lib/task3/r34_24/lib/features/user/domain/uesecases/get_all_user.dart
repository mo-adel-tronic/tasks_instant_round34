import 'package:dartz/dartz.dart';
import 'package:r34_24/core/error/failures.dart';
import '../entites/user.dart';
import '../repositories/user_repo.dart';

class GetAllUsers {
  final UserRepository repository;

  GetAllUsers(this.repository);

  Either<Failure, List<User>> call() {
    return repository.getAllUsers();
  }
}