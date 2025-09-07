import 'package:dartz/dartz.dart';
import 'package:r34_10/core/error/failures.dart';
import 'package:r34_10/features/user/domain/entites/user.dart';
import 'package:r34_10/features/user/domain/repositories/user_repository.dart';

class GetAllUsers {
  final UserRepository repository;

  GetAllUsers(this.repository);

  Either<Failure, List<User>> call() {
    return repository.getAllUsers();
  }
}