import 'package:dartz/dartz.dart';
import 'package:task7/core/error/exceptions.dart';
import 'package:task7/core/error/failures.dart';
 import 'package:task7/features/users/data/datasources/user_remote_datesources.dart';
import 'package:task7/features/users/data/models/users_model.dart';
import 'package:task7/features/users/domain/entities/user.dart';
import 'package:task7/features/users/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDatesources remoteDatasource;

  UserRepositoryImpl({required this.remoteDatasource});

  @override
  Future<Either<Failure, User>> createUser(User user) async {
    try {
      final userModel = UsersModel(
          id: '', // فارغ عند الإنشاء
          firstName: user.firstName,
          email: user.email,
          password: user.password);
      final newUser = await remoteDatasource.createUser(userModel);
      return Right(newUser);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> deleteUser(String id) async {
    try {
      final result = await remoteDatasource.deleteUser(id);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<User>>> getAllUser() async {
    try {
      final remoteUsers = await remoteDatasource.getAllUser();
      return Right(remoteUsers);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, User>> getUser(String id) async {
    try {
      final remoteUser = await remoteDatasource.getUser(id);
      return Right(remoteUser);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, User>> updateUser(User user) async {
    try {
      final userModel = UsersModel(
        id: user.id,
        firstName: user.firstName,
        email: user.email,
        password: user.password,
      );
      final updatedUser = await remoteDatasource.updateUser(userModel);
      return Right(updatedUser);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
