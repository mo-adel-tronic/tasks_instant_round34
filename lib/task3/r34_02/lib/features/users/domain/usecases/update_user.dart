// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_02/core/error/failures.dart';
import 'package:r34_02/features/users/domain/entities/user.dart';
import 'package:r34_02/features/users/domain/repositories/user_repository.dart';

class UpdateUser {
  final UserRepository repository;
  UpdateUser(this.repository);
  Either<Failure, User> call(UpdateUserParam params) {
    return repository.updateUser(params.user);
  }
}

//Update class for parameters that will sent to Update User(to edit in it in any time) (some type of isolation)

class UpdateUserParam extends Equatable {
  final User user;
  const UpdateUserParam({required this.user});

  @override
  List<Object?> get props => [user];
}
