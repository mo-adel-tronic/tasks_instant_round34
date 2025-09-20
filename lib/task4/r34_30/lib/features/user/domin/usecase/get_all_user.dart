import 'package:dartz/dartz.dart';
import 'package:r34_30/core/error/failures.dart';
import 'package:r34_30/features/user/domin/entities/user.dart';
import 'package:r34_30/features/user/domin/repositories/user_repository.dart';

class GetAllUsers {
  final UserRepository repository;

  GetAllUsers(this.repository);

  Future<Either<Failure, List<User>>> call() {
    return repository.getAllUsers();
  }
}
