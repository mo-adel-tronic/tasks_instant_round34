import 'package:r34_00/core/errors/failures.dart';

mixin MapFailuresMessages{
  String mapFailureMessage(Failure failure){
    return switch (failure){
      ServerFailure() => "Server Failure",
      CasheFailure() => "Cashe Failure",
      UnexpectedFailure() => "Unexpected Failure",
    } ;
  }
}