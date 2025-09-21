import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_24/core/error/failures.dart';
import '../entites/user.dart';
import '../repositories/user_repo.dart';

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