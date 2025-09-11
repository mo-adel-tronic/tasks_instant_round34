import 'package:dartz/dartz.dart';
import 'package:task7/core/error/failures.dart';

import '../entities/user.dart';

abstract class UserRepository {
  Future<Either<Failure, List<User>>> getAllUser();
  Future<Either<Failure, User>> getUser(String id);
  Future<Either<Failure, User>> createUser(User user);
  Future<Either<Failure, User>> updateUser(String id, User user);
  Future<Either<Failure, User>> deleteUser(String id);


}