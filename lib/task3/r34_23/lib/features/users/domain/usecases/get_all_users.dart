import 'package:dartz/dartz.dart';
import 'package:r34_23/core/error/failures.dart';
import 'package:r34_23/features/users/domain/entities/user.dart';
import 'package:r34_23/features/users/domain/repositories/user_repository.dart';

class GetAllUsers {
  final UserRepository repository;
  GetAllUsers(this.repository);

  Either<Failure, List<User>> call() {
    return repository.getAllUsers();
  }
}