 
 
import 'package:equatable/equatable.dart';

sealed class Failure extends Equatable{
const Failure([this.properties =const <dynamic>[]]);
final List<dynamic> properties;
List<Object?> get props => [properties];
}

class ServerFailure extends Failure{}
class CacheFailure extends Failure{}
class UnexpectedFailure extends Failure{}