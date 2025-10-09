import 'package:dartz/dartz.dart';
import 'package:r34_02/core/error/failures.dart';
import '../entities/product.dart';

abstract class ProductRepository {
  /// Returns all products or a failure.
  Future<Either<Failure, List<Product>>> getAllProducts();

  /// Returns a single product by ID or a failure.
  Future<Either<Failure, Product>> getProduct(String id);

  /// Creates a new product and returns it or a failure.
  Future<Either<Failure, Product>> createProduct(Product product);

  /// Updates an existing product and returns it or a failure.
  Future<Either<Failure, Product>> updateProduct(Product product);

  /// Deletes a product by ID and returns true if deleted, false if not found, or a failure.
  Future<Either<Failure, bool>> deleteProduct(String id);
}
