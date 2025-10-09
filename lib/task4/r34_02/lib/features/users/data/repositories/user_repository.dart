import 'package:dartz/dartz.dart';
import 'package:r34_02/core/error/exceptions.dart';
import 'package:r34_02/core/error/failures.dart';
import 'package:r34_02/features/users/data/datasources/user_remote_datasource.dart';
import 'package:r34_02/features/users/data/models/user_model.dart';
import 'package:r34_02/features/users/domain/entities/user.dart';
import 'package:r34_02/features/users/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource userRemoteDataSource;

  UserRepositoryImpl({required this.userRemoteDataSource});

  @override
  Future<Either<Failure, List<User>>> getAllUsers() async {
    try {
      final users = await userRemoteDataSource.getAllUsers();
      return Right(users);
    } on NotFoundException {
      return Left(NotFoundFailure());
    } on UnAuthorizedException {
      return Left(UnAuthorizedFailure());
    } on BadRequestException {
      return Left(BadRequestFailure());
    } on ServerException {
      return Left(ServerFailure());
    } catch (_) {
      return Left(UnexpectedFailure());
    }
  }

  @override
  Future<Either<Failure, User>> getUser(String id) async {
    try {
      final user = await userRemoteDataSource.getUser(id);
      return Right(user);
    } on NotFoundException {
      return Left(NotFoundFailure());
    } on UnAuthorizedException {
      return Left(UnAuthorizedFailure());
    } on BadRequestException {
      return Left(BadRequestFailure());
    } on ServerException {
      return Left(ServerFailure());
    } catch (_) {
      return Left(UnexpectedFailure());
    }
  }

  @override
  Future<Either<Failure, User>> createUser(User user) async {
    final model = UserModel(
      id: user.id,
      name: user.name,
      email: user.email,
      gender: user.gender,
    );

    try {
      final created = await userRemoteDataSource.createUser(model);
      return Right(created);
    } on NotFoundException {
      return Left(NotFoundFailure());
    } on UnAuthorizedException {
      return Left(UnAuthorizedFailure());
    } on BadRequestException {
      return Left(BadRequestFailure());
    } on ServerException {
      return Left(ServerFailure());
    } catch (_) {
      return Left(UnexpectedFailure());
    }
  }

  @override
  Future<Either<Failure, User>> updateUser(User user) async {
    final model = UserModel(
      id: user.id,
      name: user.name,
      email: user.email,
      gender: user.gender,
    );

    try {
      final updated = await userRemoteDataSource.updateUser(model);
      return Right(updated);
    } on NotFoundException {
      return Left(NotFoundFailure());
    } on UnAuthorizedException {
      return Left(UnAuthorizedFailure());
    } on BadRequestException {
      return Left(BadRequestFailure());
    } on ServerException {
      return Left(ServerFailure());
    } catch (_) {
      return Left(UnexpectedFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> deleteUser(String id) async {
    try {
      final deleted = await userRemoteDataSource.deleteUser(id);
      return Right(deleted);
    } on NotFoundException {
      return Left(NotFoundFailure());
    } on UnAuthorizedException {
      return Left(UnAuthorizedFailure());
    } on BadRequestException {
      return Left(BadRequestFailure());
    } on ServerException {
      return Left(ServerFailure());
    } catch (_) {
      return Left(UnexpectedFailure());
    }
  }
}
