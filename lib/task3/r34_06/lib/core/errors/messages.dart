//file 3
import 'package:r34_02/core/error/failures.dart';

mixin MapFailurMessages {
  String mapFailurToMssage(Failure f) {
    // switch (f) {
    //   case ServerFailure():
    //     return "Server Error";
    //   case CacheFailure():
    //     return "Cache Error";
    //   case UnexpectedFailure():
    //     return "Unexpected Error";
    // }

    //return switch as expression (return string value that has been returned from switch)
    return switch (f) {
      ServerFailure() => "Server Error",
      CacheFailure() => "Cache Error",
      UnexpectedFailure() => "Unexpected Error",
    };
  }
}
