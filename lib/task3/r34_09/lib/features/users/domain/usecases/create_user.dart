
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:task7/core/error/failures.dart';
import 'package:task7/features/users/domain/entities/user.dart';
import 'package:task7/features/users/domain/repositories/user_repository.dart';


class CreateUser {
  final UserRepository repository;
  CreateUser(this.repository);
  Future<Either<Failure, User>> call(createUserparams params) {
    return repository.createUser(params.user);
  }
}

class createUserparams extends Equatable {
  final User user;
  const createUserparams({required this.user });
  @override
  List<Object?> get props => [user];
}