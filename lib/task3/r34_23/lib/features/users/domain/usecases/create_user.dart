import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_23/core/error/failures.dart';
import 'package:r34_23/features/users/domain/entities/user.dart';
import 'package:r34_23/features/users/domain/repositories/user_repository.dart';

class CreateUser {
  final UserRepository repository;
  CreateUser(this.repository);

  Either<Failure, User> call(CreateUserParams params) {
    return repository.createUser(params.user);
  }
}

class CreateUserParams extends Equatable {
  final User user;
  const CreateUserParams(this.user);

  @override
  List<Object?> get props => [user];
}