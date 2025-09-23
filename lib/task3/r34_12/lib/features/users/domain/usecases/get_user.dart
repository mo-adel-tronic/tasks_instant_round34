import 'package:r34_12/core/error/failures.dart';
import 'package:r34_12/features/users/domain/entities/user.dart';
import 'package:r34_12/features/users/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetUser {
  final UserRepository repository;

  GetUser(this.repository);

  Either<Failure, User> call(GetUserParams params) {
    return repository.getUser(params.id);
  }
}

class GetUserParams extends Equatable {
  final String id;

  const GetUserParams({required this.id});

  @override
  List<Object> get props => [id];
}