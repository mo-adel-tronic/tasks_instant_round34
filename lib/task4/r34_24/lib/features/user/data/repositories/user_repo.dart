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
  Future<Either<Failure, List<User>>> getAllUsers() async {
    try {
      final remoteUsers = await remoteDatasource.getAllUsers();
      return Right(remoteUsers);
    } on ServerException {
      return Left(ServerFailure());
    } on BadRequestException {
      return Left(BadRequestFailure());
    } on UnauthorizedException {
      return Left(UnauthorizedFailure());
    } on NotFoundException {
      return Left(NotFoundFailure());
    } catch (e) {
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
    } on BadRequestException {
      return Left(BadRequestFailure());
    } on UnauthorizedException {
      return Left(UnauthorizedFailure());
    } on NotFoundException {
      return Left(NotFoundFailure());
    } catch (e) {
      print('Error in getUser: $e');
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
      final newUser = await remoteDatasource.createUser(userModel);
      return Right(newUser);
    } on ServerException {
      return Left(ServerFailure());
    } on BadRequestException {
      return Left(BadRequestFailure());
    } on UnauthorizedException {
      return Left(UnauthorizedFailure());
    } catch (e) {
      print('Error in createUser: $e');
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
      final updatedUser = await remoteDatasource.updateUser(userModel);
      return Right(updatedUser);
    } on BadRequestException {
      print('BadRequestException in updateUser');
      return Left(BadRequestFailure());
    } on UnauthorizedException {
      print('UnauthorizedException in updateUser');
      return Left(UnauthorizedFailure());
    } on NotFoundException {
      print('NotFoundException in updateUser');
      return Left(NotFoundFailure());
    } on ServerException {
      print('ServerException in updateUser');
      return Left(ServerFailure());
    } catch (e) {
      print('Error in updateUser: $e');
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> deleteUser(String id) async {
    try {
      final result = await remoteDatasource.deleteUser(id);
      return Right(result);
    } on NotFoundException {
      print('NotFoundException in deleteUser');
      return Right(false); // Consistent with PostRemoteDatasourceImpl
    } on BadRequestException {
      print('BadRequestException in deleteUser');
      return Left(BadRequestFailure());
    } on UnauthorizedException {
      print('UnauthorizedException in deleteUser');
      return Left(UnauthorizedFailure());
    } on ServerException {
      print('ServerException in deleteUser');
      return Left(ServerFailure());
    } catch (e) {
      print('Error in deleteUser: $e');
      return Left(ServerFailure());
    }
  }
}