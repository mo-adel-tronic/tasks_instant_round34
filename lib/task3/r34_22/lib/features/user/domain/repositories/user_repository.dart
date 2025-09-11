import 'package:dartz/dartz.dart';
import 'package:r34_22/core/error/failures.dart';
import 'package:r34_22/features/user/domain/entities/user.dart';

abstract class UserRepository {
  Either<Failure, List<User>> getAllUsers();
  Either<Failure, User> getUser(String id);
  Either<Failure, User> createUser(User user);
  Either<Failure, User> updateUser(User user);
  Either<Failure, bool> deleteUser(String id);
}