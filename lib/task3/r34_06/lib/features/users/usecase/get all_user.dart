import 'package:dartz/dartz.dart';
import 'package:r34_02/core/error/failures.dart';
import 'package:r34_02/features/users/domain/entities/user.dart';
import 'package:r34_02/features/users/domain/repositories/user_repository.dart';

class GetAllUser {
  final UserRepository repository;

  GetAllUser(this.repository);

  //Call Method
  /*Should Called Call to use it in presentation like:
  GetAllUser gp = GetAllUser(repository);
  gp(); instead of gp.call()
  
   */
  Either<Failure, List<User>> call() {
    return repository.getAllUsers();
  }
}
