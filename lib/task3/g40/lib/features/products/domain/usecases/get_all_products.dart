import 'package:dart_crud_app/core/error/failures.dart';
import 'package:dart_crud_app/features/products/domain/entities/product.dart';
import 'package:dart_crud_app/features/products/domain/repositories/product_repository.dart';
import 'package:dartz/dartz.dart';

class GetAllProducts {
  final ProductRepository repository;

  GetAllProducts(this.repository);

  Either<Failure, List<Product>> call() {
    return repository.getAllProducts();
  }
}
