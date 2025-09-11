import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:task7/core/error/failures.dart';
import 'package:task7/features/users/domain/entities/user.dart';
import 'package:task7/features/users/domain/repositories/user_repository.dart';

class UpdateUser {
  final UserRepository repository;
  UpdateUser(this.repository);
    Future<Either<Failure, User>> call(UpdateUserparams params) {
    return repository.updateUser(params.id, params.user);
  }
}

class UpdateUserparams extends Equatable{
  final String id;
  final User user;

  const UpdateUserparams({required this.id, required this.user});
  @override
  List<Object?> get props => [id, user]; 

}
