import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:task4/core/error/failures.dart';
import 'package:task4/features/users/domain/entities/user.dart';
import 'package:task4/features/users/domain/repositories/user_repository.dart';

class UpdateUser {
  final UserRepository repository;

  UpdateUser(this.repository);

  Future<Either<Failure, User>> call(UpdateUserParams params) async {
    return await repository.updateUser(params.user);
  }
}

class UpdateUserParams extends Equatable {
  final User user;

  const UpdateUserParams({required this.user});

  @override
  List<Object> get props => [user];
}
