import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_12/core/error/failures.dart';
import 'package:r34_12/features/users/domain/entities/user.dart';
import 'package:r34_12/features/users/domain/repositories/user_repository.dart';

class Updateuser {
  final UserRepository repository;

  Updateuser(this.repository);

  Either<Failure, User> call(UpdateuserParams params) {
    return repository.updateUser(params.user);
  }
}

class UpdateuserParams extends Equatable {
  final User user;

  const UpdateuserParams({required this.user});

  @override
  List<Object?> get props => [user];
}
