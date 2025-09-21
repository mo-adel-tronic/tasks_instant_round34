import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_22/core/error/failures.dart';
import 'package:r34_22/features/user/domain/entities/user.dart';
import 'package:r34_22/features/user/domain/repositories/user_repository.dart';

class GetUser {
  final UserRepository repository;
  GetUser(this.repository);

  Either<Failure, User> call(GetUserParams params) {
    return repository.getUser(params.id);
  }
}

class GetUserParams extends Equatable {
  final String id;
  const GetUserParams(this.id);

  @override
  List<Object?> get props => [id];
}