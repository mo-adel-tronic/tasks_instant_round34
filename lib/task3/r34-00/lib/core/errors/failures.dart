import 'package:equatable/equatable.dart';
import 'package:r34_00/core/errors/messages.dart';

sealed class Failure extends Equatable with MapFailuresMessages{
  final List<dynamic> properties;

  const Failure({this.properties = const <dynamic>[]});

  @override
  List<Object?> get props => [properties];
}

class ServerFailure extends Failure{}

class CasheFailure extends Failure{}

class UnexpectedFailure extends Failure{}