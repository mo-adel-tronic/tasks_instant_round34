import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_24/core/error/failures.dart';
import '../repositories/user_repo.dart';

class DeleteUser {
  final UserRepository repository;

  DeleteUser(this.repository);

  Future <Either<Failure, bool>> call(DeleteUserParams params) async{
    return await repository.deleteUser(params.id);
  }
}

class DeleteUserParams extends Equatable {
  final String id;

  const DeleteUserParams({required this.id});

  @override
  List<Object?> get props => [id];
}
