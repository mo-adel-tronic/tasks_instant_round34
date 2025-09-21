import 'package:dartz/dartz.dart';
import 'package:task3/core/error/failures.dart';
import 'package:task3/features/product/domin/entities/product.dart';

abstract class ProductRepository {
  Either<Failure, List<Product>> getAllProducts();
  Either<Failure, Product> getProduct(String id);
  Either<Failure, Product> addProduct(Product product);
  Either<Failure, Product> updateProduct(Product product);
  Either<Failure, Product> createProduct(Product product);
  Either<Failure, bool> deleteProduct(String id);

} 