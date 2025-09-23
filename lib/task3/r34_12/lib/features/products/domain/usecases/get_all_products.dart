import 'package:r34_12/core/error/failures.dart';
import 'package:r34_12/features/products/domain/entities/product.dart';
import 'package:r34_12/features/products/domain/repositories/product_repository.dart';
import 'package:dartz/dartz.dart';

class GetAllProducts {
  final ProductRepository repository;

  GetAllProducts(this.repository);

  Either<Failure, List<Product>> call() {
    return repository.getAllProducts();
  }
}