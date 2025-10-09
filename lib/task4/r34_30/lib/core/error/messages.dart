import 'failures.dart';

mixin FailureMessages {
  String mapFailureToMessage(Failure failure) {
    return switch (failure) {
      ServerFailure() => 'Server Failure',
      CacheFailure() => 'Cache Failure',
      UnexpectedFailure() => 'Unexpected Error',
      NotFoundFailure() => 'Not Found',
      BadRequestFailure() => 'Bad Request',
      UnauthorizedFailure() => 'Unauthorized Failure',
    };
  }
}
