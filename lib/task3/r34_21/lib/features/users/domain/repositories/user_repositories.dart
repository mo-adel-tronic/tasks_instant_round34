import 'package:dartz/dartz.dart';
import 'package:r34_12/core/error/faliures.dart';
import 'package:r34_12/features/users/domain/entities/user.dart';

abstract class UserRepository {
  Either<Failure, bool> adduser(String id);
  Either<Failure, User> updateuser(User user);
  Either<Failure, bool> deleteuser(String id);

} 