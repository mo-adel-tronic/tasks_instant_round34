import 'package:equatable/equatable.dart';
import 'package:r34_00/core/errors/messages.dart';

sealed class Failure extends Equatable with MapFaiureMessages{

  final List<dynamic> proberties;

  const Failure({this.proberties = const <dynamic>[]});

  @override
  List<Object?> get props => proberties;
}

class ServerFailure extends Failure{}
class CasheFailure extends Failure{}
class UnexpectedFailure extends Failure{}

