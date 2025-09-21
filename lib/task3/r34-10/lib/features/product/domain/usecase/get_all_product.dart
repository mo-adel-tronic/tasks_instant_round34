import 'package:dartz/dartz.dart';
import 'package:r34_10/core/error/failures.dart';
import 'package:r34_10/features/product/domain/entites/product.dart';
import 'package:r34_10/features/product/domain/repositories/product_repository.dart';
class GetAllProducts {
  final ProductRepository repository;

  GetAllProducts(this.repository);

  Either<Failure, List<Product>> call() {
    return repository.getAllProducts();
  }
}