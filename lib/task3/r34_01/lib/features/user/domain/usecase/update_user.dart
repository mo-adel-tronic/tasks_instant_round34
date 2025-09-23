import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_01/core/error/failures.dart';
import 'package:r34_01/features/user/domain/entity/user_entity.dart';
import 'package:r34_01/features/user/domain/repository/user_repository.dart';

class UpdateUser {
  final UserRepository repo;

  UpdateUser(this.repo);
  Either<Failure, User> call(UpdateUserParams params) {
    return repo.updateUser(params.user);
  }
}

class UpdateUserParams extends Equatable {
  final User user;

  const UpdateUserParams({required this.user});

  @override
  List<Object?> get props => [user];
}
