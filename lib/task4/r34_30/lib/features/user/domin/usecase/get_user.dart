import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_30/core/error/failures.dart';
import 'package:r34_30/features/user/domin/entities/user.dart';
import 'package:r34_30/features/user/domin/repositories/user_repository.dart';

class GetUser {
  final UserRepository repository;

  GetUser(this.repository);

  Future<Either<Failure, User>> call(GetUserParams params) {
    return repository.getUser(params.id);
  }
}

class GetUserParams extends Equatable {
  final String id;

  const GetUserParams({required this.id});

  @override
  List<Object?> get props => [id];
}
