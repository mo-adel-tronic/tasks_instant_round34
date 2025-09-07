import 'package:r34_08/core/error/failures.dart';

mixin MapFailureMessage {
  String mapFailureMessage(Failures failures) {
    return switch (failures) {
      ServerFailures() => 'Server Failure',
      CashFailures() => 'Cash Failure',
      UnExpectedFailures() => 'UnExpected Failure'
    };
  }
}
