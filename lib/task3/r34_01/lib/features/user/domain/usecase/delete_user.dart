import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_01/core/error/failures.dart';
import 'package:r34_01/features/user/domain/repository/user_repository.dart';

class DeleteUser {
  final UserRepository repo;
  DeleteUser(this.repo);

  Either<Failure, bool> call(DeleteUserParams params) {
    return repo.deleteUser(params.id);
  }
}

class DeleteUserParams extends Equatable {
  final String id;

  const DeleteUserParams({required this.id});

  @override
  List<Object?> get props => [id];
}
