import 'package:dartz/dartz.dart';
import 'package:task4/core/error/failures.dart';
import 'package:task4/features/users/domain/entities/user.dart';
import 'package:task4/features/users/domain/repositories/user_repository.dart';

class GetAllUsers {
  final UserRepository repository;

  GetAllUsers(this.repository);

  Future<Either<Failure, List<User>>> call() async {
    return await repository.getAllUsers();
  }
}
