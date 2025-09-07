import 'package:dartz/dartz.dart';
import 'package:r34_08/core/error/failures.dart';
import 'package:r34_08/feature/products/domain/entities/product.dart';

abstract class ProductRepository {
  Either<Failures, List<Product>> getAllProducts();
  Either<Failures, Product> getProduct(String id);
  Either<Failures, Product> updateProducts(Product product);
  Either<Failures, Product> createProducts(Product product);
  Either<Failures, bool> deleteProducts(String id);
}