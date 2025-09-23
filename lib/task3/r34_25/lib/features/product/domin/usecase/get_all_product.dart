import 'package:dartz/dartz.dart';
import 'package:task3/core/error/failures.dart';
import 'package:task3/features/product/domin/entities/product.dart';
import 'package:task3/features/product/domin/repositories/product_repository.dart';

class GetAllProducts {
  final ProductRepository repository;

  GetAllProducts(this.repository);

  Either<Failure, List<Product>> call() {
    return repository.getAllProducts();
  }
}