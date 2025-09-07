import 'package:dartz/dartz.dart';
import 'package:r34_21/core/error/failures.dart';
import 'package:r34_21/features/product/domain/entities/product.dart';


abstract class ProductRepository {
  Either<Failure, List<Product>> getAllProducts();
  Either<Failure, Product> getProduct(String id);
  Either<Failure, Product> addProduct(Product product);
  Either<Failure, Product> updateProduct(Product product);
  Either<Failure, Product> createProduct(Product product);
  Either<Failure, bool> deleteProduct(String id);

} 