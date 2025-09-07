import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_02/core/error/failures.dart';
import 'package:r34_02/features/users/domain/entities/user.dart';
import 'package:r34_02/features/users/domain/repositories/user_repository.dart';

class GetUser {
  final UserRepository repository;
  GetUser(this.repository);
  Either<Failure, User> call(GetUserParam params) {
    return repository.getUser(params.id);
  }
}

//create class for parameters that will sent to get User(to edit in it in any time) (some type of isolation)

class GetUserParam extends Equatable {
  final String id;
  const GetUserParam({required this.id});

  @override
  List<Object?> get props => [id];
}
