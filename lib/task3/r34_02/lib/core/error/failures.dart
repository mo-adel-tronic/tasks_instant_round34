//file 2
import 'package:equatable/equatable.dart';

sealed class Failure extends Equatable {
  // to compare between two failures
  const Failure([
    this.properties = const <dynamic>[],
  ]); //has default value(empty list)
  final List<dynamic> properties; //any error has this property
  /*
properties examples: title is required, price is not valid
 */
  @override
  List<Object?> get props => [properties];
}

//use them to return type (ServerFailure,...) to user
class ServerFailure extends Failure {}

class CacheFailure extends Failure {}

class UnexpectedFailure extends Failure {}
