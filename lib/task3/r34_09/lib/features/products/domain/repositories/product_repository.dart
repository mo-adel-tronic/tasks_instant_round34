import 'package:dartz/dartz.dart';
import 'package:task7/core/error/failures.dart';
import 'package:task7/features/products/domain/entities/product.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> getAllProducts();
  Future<Either<Failure, Product>> getProduct(String id);
  Future<Either<Failure, Product>> createProduct(Product product);
  Future<Either<Failure, Product>> updateProducts(String id, Product product);
  Future<Either<Failure, Product>> deleteProduct(String id);
}
