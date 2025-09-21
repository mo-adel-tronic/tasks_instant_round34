import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_24/core/error/failures.dart';
import '../repositories/user_repo.dart';

class DeleteUser {
  final UserRepository repository;

  DeleteUser(this.repository);

  Either<Failure, bool> call(String id) {
    return repository.deleteUser(id);
  }
}

class DeleteUserParams extends Equatable {
  final String id;

  const DeleteUserParams({required this.id});

  @override
  List<Object?> get props => [id];
}