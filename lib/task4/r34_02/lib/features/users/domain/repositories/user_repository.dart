import 'package:dartz/dartz.dart';
import 'package:r34_02/core/error/failures.dart';
import '../entities/user.dart';

abstract class UserRepository {
  Future<Either<Failure, List<User>>> getAllUsers();
  //why Either from dartz library?  getAllUser will return List of User or failur

  Future<Either<Failure, User>> getUser(String id);
  Future<Either<Failure, User>> createUser(User user);
  Future<Either<Failure, User>> updateUser(User user);
  Future<Either<Failure, bool>> deleteUser(String id);
}

//implement them in data layer

//implement class use case for every method to use it only in presentation layer
//Create use case for  getUser , use case for createUser , ...
