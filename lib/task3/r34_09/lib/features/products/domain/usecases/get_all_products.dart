import 'package:task7/core/error/failures.dart';
import 'package:task7/features/products/domain/entities/product.dart';
import 'package:dartz/dartz.dart';
import 'package:task7/features/products/domain/repositories/product_repository.dart';
  class GetAllProducts {
  final ProductRepository repository;
  GetAllProducts(this.repository);
  Future<Either<Failure, List<Product>>> call() {
    return repository.getAllProducts();
  }
}
