import 'package:dartz/dartz.dart';
import 'package:r34_02/core/error/failures.dart';
import '../entities/user.dart';

abstract class UserRepository {
  Either<Failure, List<User>> getAllUsers();
  //why Either from dartz library?  getAllUser will return List of User or failur

  Either<Failure, User> getUser(String id);
  Either<Failure, User> createUser(User user);
  Either<Failure, User> updateUser(User user);
  Either<Failure, bool> deleteUser(String id);
}

//implement them in data layer

//implement class use case for every method to use it only in presentation layer
//Create use case for  getUser , use case for createUser , ...
