import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:task3/core/error/failures.dart';
import 'package:task3/features/user/domin/repositories/user_repository.dart';

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
