import 'package:dartz/dartz.dart';
import 'package:r34_22/core/error/failures.dart';
import 'package:r34_22/features/products/domain/entities/product.dart';

abstract class ProductRepository {
  Either<Failure, List<Product>> getAllProducts();
  Either<Failure, Product> getProduct(String id);
  Either<Failure, Product> createProduct(Product product);
  Either<Failure, Product> updateProducts(String id, Product product);
  Either<Failure, Product> deleteProduct(String id);
}
