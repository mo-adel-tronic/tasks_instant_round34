import "package:equatable/equatable.dart";

sealed class Failures extends Equatable {
  const Failures([this.properties = const <dynamic>[]]);
  final List<dynamic> properties;
  @override
  List<Object?> get props => [properties];
}


class ServerFailures extends Failures{

}

class CashFailures extends Failures{

}

class UnExpectedFailures extends Failures{

}
 