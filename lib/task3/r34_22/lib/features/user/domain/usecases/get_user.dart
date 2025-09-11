import 'package:dartz/dartz.dart';
import 'package:r34_22/core/error/failures.dart';
import 'package:r34_22/features/user/domain/entities/user.dart';
import 'package:r34_22/features/user/domain/repositories/user_repository.dart';

class GetAllUsers {
  final UserRepository repository;

  GetAllUsers(this.repository);

  Either<Failure, List<User>> call() {
    return repository.getAllUsers();
  }
}