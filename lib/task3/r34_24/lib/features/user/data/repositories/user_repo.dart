import 'package:dartz/dartz.dart';
import 'package:r34_24/core/error/exception.dart';
import 'package:r34_24/core/error/failures.dart';
import 'package:r34_24/features/user/data/datasources/user_remote_datasource.dart';
import 'package:r34_24/features/user/data/models/user_model.dart';
import 'package:r34_24/features/user/domain/entites/user.dart';
import 'package:r34_24/features/user/domain/repositories/user_repo.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDatasource remoteDatasource;

  UserRepositoryImpl({required this.remoteDatasource});

  @override
  Either<Failure, List<User>> getAllUsers() {
    try {
      final remoteUsers = remoteDatasource.getAllUsers();
      return Right(remoteUsers);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Either<Failure, User> getUser(String id) {
    try {
      final remoteUser = remoteDatasource.getUser(id);
      return Right(remoteUser);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Either<Failure, User> createUser(User user) {
    try {
      final userModel = UserModel(
        id: user.id,
        name: user.name,
        email: user.email,
      );

      final newUser = remoteDatasource.createUser(userModel);
      return Right(newUser);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Either<Failure, User> updateUser(User user) {
    try {
      final userModel = UserModel(
        id: user.id,
        name: user.name,
        email: user.email,
      );

      final updatedUser = remoteDatasource.updateUser(userModel);
      return Right(updatedUser);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Either<Failure, bool> deleteUser(String id) {
    try {
      final result = remoteDatasource.deleteUser(id);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
