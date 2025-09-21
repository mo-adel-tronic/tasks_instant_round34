import 'package:dartz/dartz.dart';
import 'package:r34_22/core/error/failures.dart';
import 'package:r34_22/features/products/domain/entities/product.dart';
import 'package:r34_22/features/products/domain/repositories/product_repository.dart';

class GetAllProducts {
  final ProductRepository repository;
  GetAllProducts(this.repository);
  Either<Failure, List<Product>> call() {
    return repository.getAllProducts();
  }
}
