import 'package:r34_12/core/error/failures.dart';
import 'package:r34_12/features/users/domain/entities/user.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepository {
  Either<Failure, List<User>> getAllUsers();
  Either<Failure, User> getUser(String id);
  Either<Failure, User> createUser(User user);
  Either<Failure, User> updateUser(User user);
  Either<Failure, bool> deleteUser(String id);
}