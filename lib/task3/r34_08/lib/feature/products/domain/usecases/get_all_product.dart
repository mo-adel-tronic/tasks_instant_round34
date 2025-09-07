import 'package:dartz/dartz.dart';
import 'package:r34_08/core/error/failures.dart';
import 'package:r34_08/feature/products/domain/entities/product.dart';
import 'package:r34_08/feature/products/domain/repositories/product_repository.dart';

class GetAllProduct {
  final ProductRepository repository;

  GetAllProduct(this.repository);

  Either<Failures, List<Product>> call() {
    return repository.getAllProducts();
  }
}
