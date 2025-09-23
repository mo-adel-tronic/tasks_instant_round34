import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_22/core/error/failures.dart';
import 'package:r34_22/features/user/domain/entities/user.dart';
import 'package:r34_22/features/user/domain/repositories/user_repository.dart';

class CreateUser {
  final UserRepository repository;
  CreateUser(this.repository);

  Either<Failure, User> call(CreateUserParams params) {
    return repository.createUser(params.user);
  }
}

class CreateUserParams extends Equatable {
  final User user;
  const CreateUserParams(this.user, {required User});

  @override
  List<Object?> get props => [user];
}