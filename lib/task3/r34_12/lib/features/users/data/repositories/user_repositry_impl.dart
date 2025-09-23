import 'package:dartz/dartz.dart';
import 'package:r34_12/core/error/exceptions.dart';
import 'package:r34_12/core/error/failures.dart';
import 'package:r34_12/features/users/data/datasources/user_remote_datasource.dart';
import 'package:r34_12/features/users/data/models/user_model.dart';
import 'package:r34_12/features/users/domain/entities/user.dart';
import 'package:r34_12/features/users/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl({required this.remoteDataSource});

  @override
  Either<Failure, List<User>> getAllUsers() {
    try {
      final remoteUsers = remoteDataSource.getAllUsers();
      return Right(remoteUsers);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Either<Failure, User> getUser(String id) {
    try {
      final remoteUser = remoteDataSource.getUser(id);
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
      final newUser = remoteDataSource.createUser(userModel);
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
      final updatedUser = remoteDataSource.updateUser(userModel);
      return Right(updatedUser);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Either<Failure, bool> deleteUser(String id) {
    try {
      final result = remoteDataSource.deleteUser(id);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}