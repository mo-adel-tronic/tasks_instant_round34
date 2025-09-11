import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:task7/core/error/failures.dart';
import 'package:task7/features/users/domain/entities/user.dart';
import 'package:task7/features/users/domain/repositories/user_repository.dart';

class GetUser {
  final UserRepository repository;
  GetUser(this.repository);
    Future<Either<Failure, User>> call(getUserparams params) {
    return repository.deleteUser(params.id);
  }
}

class getUserparams extends Equatable {
  final String id;
  const getUserparams({required this.id});
  @override
  List<Object?> get props => [id];
}
