import 'package:dartz/dartz.dart';
import 'package:r34_23/core/error/failures.dart';
import 'package:r34_23/features/products/domain/entities/product.dart';
import 'package:r34_23/features/products/domain/repositories/product_repository.dart';

class GetAllProducts {
  final ProductRepository repository;
  GetAllProducts(this.repository);
  Either<Failure,List<Product>> call(){
   return repository.getallproduct();
  }
}