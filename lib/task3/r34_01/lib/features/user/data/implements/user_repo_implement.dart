import 'package:dartz/dartz.dart';
import 'package:r34_01/core/error/exceptions.dart';
import 'package:r34_01/core/error/failures.dart';
import 'package:r34_01/features/user/data/model/user_model.dart';
import 'package:r34_01/features/user/data/sources/user_remote_datasource.dart';
import 'package:r34_01/features/user/domain/entity/user_entity.dart';
import 'package:r34_01/features/user/domain/repository/user_repository.dart';

class UserRepoImplement implements UserRepository {
  final UserRemoteDataSource remoteDatasource;
  UserRepoImplement({required this.remoteDatasource});

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
        name: user.name,
        id: user.id,
        description: user.description,
        price: user.price,
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
        name: user.name,
        id: user.id,
        description: user.description,
        price: user.price,
      );
      final updateUser = remoteDatasource.updateUser(userModel);
      return Right(updateUser);
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
