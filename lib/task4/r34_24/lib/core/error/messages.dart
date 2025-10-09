import 'failures.dart';

mixin MapFailureMessages {
  String mapFailureMessages(Failure failure) {
    return switch (failure) {
      ServerFailure() => 'Server error occurred',
      CacheFailure() => 'Cache error occurred',
      UnexpectedFailure() => 'Unexpected error occurred',
      NotFoundFailure() => 'Not Found error occurred',
      BadRequestFailure() => ' BadRequest error occurred',
      UnauthorizedFailure() => 'Unauthorized error occurred',
    };
  }
}