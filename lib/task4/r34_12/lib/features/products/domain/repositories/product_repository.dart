import 'package:r34_12/core/error/failures.dart';
import '../entities/product.dart';
import 'package:dartz/dartz.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> getAllProducts();
  Future<Either<Failure, Product>> getProduct(String id);
  Future<Either<Failure, Product>> createProduct(Product product);
  Future<Either<Failure, Product>> updateProduct(Product product);
  Future<Either<Failure, bool>> deleteProduct(String id);
}