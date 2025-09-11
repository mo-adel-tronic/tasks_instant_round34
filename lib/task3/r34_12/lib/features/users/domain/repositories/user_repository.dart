import 'package:dartz/dartz.dart';
import 'package:r34_12/core/error/failures.dart';
import 'package:r34_12/features/users/domain/entities/user.dart';

abstract class UserRepository {
  Either<Failure, bool> addUser(String id);
  Either<Failure, User> updateUser(User user);
  Either<Failure, bool> deleteUser(String id);

} 