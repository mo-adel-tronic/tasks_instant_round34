import 'package:dartz/dartz.dart';
import 'package:r34_12/core/error/faliures.dart';
import 'package:r34_12/features/products/domain/entities/product.dart';
import 'package:r34_12/features/products/domain/repositories/product_repositories.dart';


class GetAllProducts {
  final ProductRepository repository;

  GetAllProducts(this.repository);

  Either<Failure, List<Product>> call() {
    return repository.getAllProducts();
  }
}