import 'package:dartz/dartz.dart';
import 'package:task3/core/error/exceptions.dart';
import 'package:task3/core/error/failures.dart';
import 'package:task3/features/user/data/datasource/user_remote_datasource.dart';
import 'package:task3/features/user/data/models/user_model.dart';
import 'package:task3/features/user/domin/entities/user.dart';
import 'package:task3/features/user/domin/repositories/user_repository.dart';

class UserRepositoryImp implements UserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImp({required this.remoteDataSource});

  @override
  Either<Failure, List<User>> getAllUsers() {
    try {
      final remoteUsers = remoteDataSource.getAllUser();
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
      final newUser = User(id: user.id, name: user.name, email: user.email);
      return Right(newUser);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Either<Failure, User> updateUser(User user) {
    try {
      final userModel = UsersModel(
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
