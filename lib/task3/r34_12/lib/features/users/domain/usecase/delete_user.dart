import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_12/core/error/failures.dart';
import 'package:r34_12/features/users/domain/repositories/user_repository.dart';

class Deleteuser {
  final UserRepository repository;

  Deleteuser(this.repository);

  Either<Failure, bool> call(DeleteuserParams params) {
    return repository.deleteUser(params.id);
  }
}

class  DeleteuserParams extends Equatable {
  final String id;

  const DeleteuserParams({required this.id});

  @override
  List<Object?> get props => [id];
}
