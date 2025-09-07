import 'package:dartz/dartz.dart';
import 'package:r34_24/core/error/failures.dart';
import '../entites/user.dart';
import '../repositories/user_repo.dart';

class GetUser {
  final UserRepository repository;

  GetUser(this.repository);

  Either<Failure, User> call(String id) {
    return repository.getUser(id);
  }
}