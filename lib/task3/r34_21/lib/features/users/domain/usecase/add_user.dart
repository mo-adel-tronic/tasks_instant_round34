import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:r34_12/core/error/faliures.dart';
import 'package:r34_12/features/users/domain/repositories/user_repositories.dart';


class Adduser {
  final UserRepository repository;

  Adduser(this.repository);

  Either<Failure, bool> call(AdduserParams params) {
    return repository.adduser(params.id);
  }
}


class  AdduserParams extends Equatable {
  final String id;

  const AdduserParams({required this.id});

  @override
  List<Object?> get props => [id];
}