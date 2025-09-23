import 'package:dartz/dartz.dart';
import 'package:r34_24/core/error/failures.dart';
import '../entites/user.dart';
import '../repositories/user_repo.dart';
import 'package:equatable/equatable.dart';

class GetUser {
  final UserRepository repository;

  GetUser(this.repository);

  Either<Failure, User> call(GetUserParams params) {
    return repository.getUser(params.id);
  }
}
  class GetUserParams extends Equatable{
    final String id;
    const GetUserParams({required this.id});
    @override
    List<Object?> get props =>[id];
  
}