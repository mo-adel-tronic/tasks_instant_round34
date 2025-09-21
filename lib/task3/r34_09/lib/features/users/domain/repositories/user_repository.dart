import 'package:dartz/dartz.dart';
import 'package:task7/core/error/failures.dart';

import '../entities/user.dart';

abstract class UserRepository {
  Future<Either<Failure, List<User>>> getAllUser();
  Future<Either<Failure, User>> getUser(String id);
  Future<Either<Failure, User>> createUser(User user);
  Future<Either<Failure, User>> updateUser(  User user);
  Future<Either<Failure, bool>> deleteUser(String id);


}