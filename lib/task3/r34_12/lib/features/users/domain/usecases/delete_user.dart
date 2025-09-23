import 'package:r34_12/core/error/failures.dart';
import 'package:r34_12/features/users/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class DeleteUser {
  final UserRepository repository;

  DeleteUser(this.repository);

  Either<Failure, bool> call(DeleteUserParams params) {
    return repository.deleteUser(params.id);
  }
}

class DeleteUserParams extends Equatable {
  final String id;

  const DeleteUserParams({required this.id});

  @override
  List<Object?> get props => [id];
}