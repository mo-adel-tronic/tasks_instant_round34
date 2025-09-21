import 'package:dartz/dartz.dart';
import 'package:r34_12/core/error/faliures.dart';
import 'package:r34_12/features/products/domain/entities/product.dart';

abstract class ProductRepository {
  Either<Failure, List<Product>> getAllProducts();
  Either<Failure, Product> getProduct(String id);
  Either<Failure, Product> addProduct(Product product);
  Either<Failure, Product> updateProduct(Product product);
  Either<Failure, Product> createProduct(Product product);
  Either<Failure, bool> deleteProduct(String id);

} 