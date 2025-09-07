import '../entity/user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:r34_01/core/error/failures.dart';

abstract class UserRepository {
  Either<Failure, List<User>> getAllUsers();
  Either<Failure, User> getUser(String id);
  Either<Failure, User> createUser(User user);
  Either<Failure, User> updateUser(User user);
  Either<Failure, bool> deleteUser(String id);
}
