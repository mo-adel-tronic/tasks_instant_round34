import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_10/core/error/failures.dart';
import 'package:r34_10/features/user/domain/entites/user.dart';
import 'package:r34_10/features/user/domain/repositories/user_repository.dart';

class UpdateUser {
  final UserRepository repository;

  UpdateUser(this.repository);

  Either<Failure, User> call(UpdateUserParams params) {
    return repository.updateUser(params.user);
  }
}

class UpdateUserParams extends Equatable {
  final User user;

  const UpdateUserParams(this.user);

  @override
  List<Object?> get props => [user];
}