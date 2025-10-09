import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:task4/core/error/failures.dart';
import 'package:task4/features/users/domain/repositories/user_repository.dart';

class DeleteUser {
  final UserRepository repository;

  DeleteUser(this.repository);

  Future<Either<Failure, bool>> call(DeleteUserParams params) async {
    return await repository.deleteUser(params.id);
  }
}

class DeleteUserParams extends Equatable {
  final String id;

  const DeleteUserParams({required this.id});

  @override
  List<Object?> get props => [id];
}
