import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_01/core/error/failures.dart';
import 'package:r34_01/features/user/domain/entity/user_entity.dart';
import 'package:r34_01/features/user/domain/repository/user_repository.dart';

class CreateUser {
  final UserRepository repo;

  CreateUser(this.repo);
  Either<Failure, User> call(CreateUserParams params) {
    return repo.createUser(params.user);
  }
}

class CreateUserParams extends Equatable {
  final User user;

  const CreateUserParams({required this.user});

  @override
  List<Object?> get props => [user];
}
