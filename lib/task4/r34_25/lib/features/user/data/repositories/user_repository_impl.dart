import 'package:dartz/dartz.dart';
import 'package:task3/core/error/exceptions.dart';
import 'package:task3/core/error/failures.dart';
import 'package:task3/features/user/data/datasources/user_remote_datesources.dart';
import 'package:task3/features/user/data/models/users_model.dart';
import 'package:task3/features/user/domin/entities/user.dart';
import 'package:task3/features/user/domin/repositories/user_repository.dart';

class UserRepositoryImp implements UserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImp({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<User>>> getAllUsers() async {
    try {
      final remoteUsers = await remoteDataSource.getAllUser();
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
        name: user.name,
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
        name: user.name,
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
