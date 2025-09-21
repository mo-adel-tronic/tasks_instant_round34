import 'package:equatable/equatable.dart';

sealed class Failure extends Equatable{
  
  final List <dynamic> proprites;
  const Failure([this.proprites= const <dynamic>[]]);
  
  
  
  @override
  List <Object?> get props=>[proprites];
}
class Serverfailure extends Failure{}

class Cachefailure extends Failure{}

class Unexcepcted extends Failure{}