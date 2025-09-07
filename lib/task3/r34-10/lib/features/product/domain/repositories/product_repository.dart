import 'package:dartz/dartz.dart';
import 'package:r34_10/core/error/failures.dart';
import 'package:r34_10/features/product/domain/entites/product.dart';
abstract class ProductRepository {
  Either<Failure, List<Product>> getAllProducts();
  Either<Failure, Product> getProduct(String id);
  Either<Failure, Product> addProduct(Product product);
  Either<Failure, Product> updateProduct(Product product);
  Either<Failure, Product> createProduct(Product product);
  Either<Failure, bool> deleteProduct(String id);

} 