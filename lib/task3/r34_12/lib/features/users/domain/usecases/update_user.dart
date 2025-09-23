import 'package:r34_12/core/error/failures.dart';
import 'package:r34_12/features/users/domain/entities/user.dart';
import 'package:r34_12/features/users/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class UpdateUser {
  final UserRepository repository;

  UpdateUser(this.repository);

  Either<Failure, User> call(UpdateUserParams params) {
    return repository.updateUser(params.user);
  }
}

class UpdateUserParams extends Equatable {
  final User user;

  const UpdateUserParams({required this.user});

  @override
  List<Object> get props => [user];
}