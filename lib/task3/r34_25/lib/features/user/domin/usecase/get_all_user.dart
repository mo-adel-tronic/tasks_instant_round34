import 'package:dartz/dartz.dart';
import 'package:task3/core/error/failures.dart';
import 'package:task3/features/user/domin/entities/user.dart';
import 'package:task3/features/user/domin/repositories/user_repository.dart';

class GetAllUsers {
  final UserRepository repository;

  GetAllUsers(this.repository);

  Either<Failure, List<User>> call() {
    return repository.getAllUsers();
  }
}
