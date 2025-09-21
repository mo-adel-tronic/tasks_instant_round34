import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_23/core/error/failures.dart';
import 'package:r34_23/features/products/domain/entities/product.dart';
import 'package:r34_23/features/products/domain/repositories/product_repository.dart';

class Createproduct{
  final ProductRepository repository;
  Createproduct(this.repository);
  Either<Failure,Product> call(Createproductparams params){
    return repository.createproduct(params.products);
  }
}
class Createproductparams extends Equatable{
  final Product products;
  const Createproductparams(this.products);
  @override
  List<Object?> get props =>[products];
}