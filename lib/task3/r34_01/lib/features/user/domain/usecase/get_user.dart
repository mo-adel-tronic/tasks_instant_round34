import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_01/core/error/failures.dart';
import 'package:r34_01/features/user/domain/entity/user_entity.dart';
import 'package:r34_01/features/user/domain/repository/user_repository.dart';

class GetUser {
  final UserRepository repo;

  GetUser(this.repo);

  Either<Failure, User> call(GetUserParams params) {
    return repo.getUser(params.id);
  }
}

class GetUserParams extends Equatable {
  final String id;

  const GetUserParams({required this.id});

  @override
  List<Object> get props => [id];
}
