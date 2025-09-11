 
 
import 'package:task7/core/error/failures.dart';

mixin MapFailureMessages {
  String mapFailureToMessage(Failure failure) {
    return switch (failure) {
      ServerFailure() => 'Server Failure',
      CacheFailure() => 'Cache Failure',
      UnexpectedFailure() => 'Unexpected Error',
    };
  }
}