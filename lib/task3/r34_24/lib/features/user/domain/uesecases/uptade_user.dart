import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_24/core/error/failures.dart';
import '../entites/user.dart';
import '../repositories/user_repo.dart';

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
  List<Object?> get props => [user];
}