import 'package:dartz/dartz.dart';

import 'package:r34_21/core/error/failures.dart';
import 'package:r34_21/features/user/domain/entities/user.dart';

abstract class UserRepository {
  Either<Failure, bool> adduser(String id);
  Either<Failure, User> updateuser(User user);
  Either<Failure, bool> deleteuser(String id);

} 