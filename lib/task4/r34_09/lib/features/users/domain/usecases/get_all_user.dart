import 'package:dartz/dartz.dart';
import 'package:task7/core/error/failures.dart';
import 'package:task7/features/users/domain/entities/user.dart';
import 'package:task7/features/users/domain/repositories/user_repository.dart';

class GetAllUser {
  final UserRepository repository;
  GetAllUser(this.repository);
    Future<Either<Failure, List<User>>> call() {
    return repository.getAllUser();
  }
}
