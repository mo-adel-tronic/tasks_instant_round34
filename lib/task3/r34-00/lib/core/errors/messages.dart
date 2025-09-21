import 'package:r34_00/core/errors/failures.dart';

mixin MapFaiureMessages {
  String mapFaiureMessage(Failure failure){
    return switch(failure){
      ServerFailure() => "Server Faliure",
      CasheFailure() => "Cache Faliure",
      UnexpectedFailure()=>"Unexpected Failure"
    };
  }
}