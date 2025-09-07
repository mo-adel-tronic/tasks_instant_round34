import 'package:dartz/dartz.dart';
import 'package:r34_23/core/error/failures.dart';
import 'package:r34_23/features/products/domain/entities/product.dart';
import 'package:r34_23/features/products/domain/repositories/product_repository.dart';

class Updateproduct{
  final ProductRepository repository;
  Updateproduct(this.repository);
  Either<Failure,Product> call(UpdateProductparams params){
    return repository.updateproduct(params.products);
  }
}
class UpdateProductparams{
  final Product products;
  UpdateProductparams(this.products);
  List<Object?> get props=>[products];
}