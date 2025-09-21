import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_23/core/error/failures.dart';
import 'package:r34_23/features/products/domain/entities/product.dart';
import 'package:r34_23/features/products/domain/repositories/product_repository.dart';

class Getproduct{
  final ProductRepository repository;
  Getproduct(this.repository);
 Either<Failure,Product> call(GetProductparams params){
  return repository.getproduct(params.id);
 }
}
class GetProductparams extends Equatable{
  final String id;
  GetProductparams(this.id);
 @override
  List<Object?> get props=>[id];
}