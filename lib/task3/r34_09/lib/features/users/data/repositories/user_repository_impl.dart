import 'package:dartz/dartz.dart';
import 'package:task7/core/error/exceptions.dart';
import 'package:task7/core/error/failures.dart';
import 'package:task7/features/users/data/datasources/user_remote_datesources.dart';
import 'package:task7/features/users/data/models/users_model.dart';
import 'package:task7/features/users/domain/entities/user.dart';
import 'package:task7/features/users/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
    late final UserRemoteDatesources remoteDatasource;

  @override
  Future<Either<Failure, User>> createUser(User user)async {
       try {
      final Usermodel = UsersModel(id: user.id, name: user.name, email: user.email, password: user.password);
      final newproduct = remoteDatasource.createUser(Usermodel);
      return Right(newproduct);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, User>> deleteUser(String id)async {
    try {
      final result = remoteDatasource.deleteUser(id);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<User>>> getAllUser()async {
      try {
      final remoteuser = remoteDatasource.getAllUser();
      return Right(remoteuser);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, User>> getUser(String id) async{
    try {
      final remoteuser = remoteDatasource.getUser(id);
      return Right(remoteuser);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, User>> updateUser(String id, User user) async{
    try {
      final usermodel = UsersModel(id: user.id, name: user.name, email: user.email, password: user.password);
      final updateproduct = remoteDatasource.updateUser(usermodel);
      return Right(updateproduct);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}