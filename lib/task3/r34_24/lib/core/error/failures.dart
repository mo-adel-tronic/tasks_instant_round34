import 'package:equatable/equatable.dart';
sealed class Failure extends Equatable{
  const Failure ([this.propeties =const<dynamic>[]]);
  final List <dynamic> propeties;
  @override
  List<Object?> get props => [propeties];
  }
  class ServerFailure extends Failure{}
  class CacheFailure extends Failure{}
  class UnexpectedFailure extends Failure{}