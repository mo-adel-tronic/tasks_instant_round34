import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_23/core/error/failures.dart';
import 'package:r34_23/features/products/domain/repositories/product_repository.dart';

class Deleteproduct{
  final ProductRepository repository;
  Deleteproduct(this.repository);
  Either<Failure,bool> call(Deleteproductparams params){
    return repository.deleteproduct(params.id);
  }
}
class Deleteproductparams extends Equatable{
  final String id;
  Deleteproductparams(this.id);
  @override
  List<Object?> get props=>[id];
}