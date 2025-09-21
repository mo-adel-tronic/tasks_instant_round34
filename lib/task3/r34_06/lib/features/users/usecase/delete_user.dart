// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_02/core/error/failures.dart';
import 'package:r34_02/features/users/domain/repositories/user_repository.dart';

class DeleteUser {
  final UserRepository repository;
  DeleteUser(this.repository);
  Either<Failure, bool> call(DeleteUserParam params) {
    return repository.deleteUser(params.id);
  }
}

//create class for parameters that will sent to delete User(to edit in it in any time) (some type of isolation)

class DeleteUserParam extends Equatable {
  final String id;
  const DeleteUserParam({required this.id});

  @override
  List<Object?> get props => [id];
}
