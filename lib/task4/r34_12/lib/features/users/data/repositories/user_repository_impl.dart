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
  Future<Either<Failure, List<User>>> getAllUsers() async {
    try {
      final remoteUsers = await remoteDataSource.getAllUsers();
      return Right(remoteUsers);
    } on NotFoundException {
      return Left(NotFoundFailure());
    } on BadRequestException {
      return Left(BadRequestFailure());
    } on UnauthorizedException {
      return Left(UnauthorizedFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, User>> getUser(String id) async {
    try {
      final remoteUser = await remoteDataSource.getUser(id);
      return Right(remoteUser);
    } on NotFoundException {
      return Left(NotFoundFailure());
    } on BadRequestException {
      return Left(BadRequestFailure());
    } on UnauthorizedException {
      return Left(UnauthorizedFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, User>> createUser(User user) async {
    try {
      final userModel = UserModel(
        id: user.id,
        firstName: user.firstName,
        email: user.email,
      );
      final newUser = await remoteDataSource.createUser(userModel);
      return Right(newUser);
    } on NotFoundException {
      return Left(NotFoundFailure());
    } on BadRequestException {
      return Left(BadRequestFailure());
    } on UnauthorizedException {
      return Left(UnauthorizedFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, User>> updateUser(User user) async {
    try {
      final userModel = UserModel(
        id: user.id,
        firstName: user.firstName,
        email: user.email,
      );
      final updatedUser = await remoteDataSource.updateUser(userModel);
      return Right(updatedUser);
    } on NotFoundException {
      return Left(NotFoundFailure());
    } on BadRequestException {
      return Left(BadRequestFailure());
    } on UnauthorizedException {
      return Left(UnauthorizedFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> deleteUser(String id) async {
    try {
      final result = await remoteDataSource.deleteUser(id);
      return Right(result);
    } on NotFoundException {
      return Left(NotFoundFailure());
    } on BadRequestException {
      return Left(BadRequestFailure());
    } on UnauthorizedException {
      return Left(UnauthorizedFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}