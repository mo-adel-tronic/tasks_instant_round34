import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:task3/core/error/failures.dart';
import 'package:task3/features/user/domin/entities/user.dart';
import 'package:task3/features/user/domin/repositories/user_repository.dart';

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
