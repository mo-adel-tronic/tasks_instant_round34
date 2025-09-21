import 'package:r34_12/core/error/failures.dart';
import 'package:r34_12/features/users/domain/entities/user.dart';
import 'package:r34_12/features/users/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class CreateUser {
  final UserRepository repository;

  CreateUser(this.repository);

  Either<Failure, User> call(CreateUserParams params) {
    return repository.createUser(params.user);
  }
}

class CreateUserParams extends Equatable {
  final User user;

  const CreateUserParams({required this.user});

  @override
  List<Object?> get props => [user];
}