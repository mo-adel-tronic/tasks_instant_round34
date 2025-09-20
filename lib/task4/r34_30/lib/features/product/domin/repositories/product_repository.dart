import 'package:dartz/dartz.dart';
import 'package:r34_30/core/error/failures.dart';
import 'package:r34_30/features/product/domin/entities/product.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> getAllProducts();
  Future<Either<Failure, Product>> getProduct(String id);
  Future<Either<Failure, Product>> addProduct(Product product);
  Future<Either<Failure, Product>> updateProduct(Product product);
  Future<Either<Failure, Product>> createProduct(Product product);
  Future<Either<Failure, bool>> deleteProduct(String id);
}
