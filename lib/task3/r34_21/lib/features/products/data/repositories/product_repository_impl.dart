import 'package:r34_12/core/error/faliures.dart';
import 'package:r34_12/features/products/domain/entities/product.dart';

import 'package:dartz/dartz.dart';

abstract class ProductRepository {
  Either<Failure, List<Product>> getallproducts();
    Either<Failure, Product> getproduct(String id);
    Either<Failure, Product> createProduct(Product product);
    Either<Failure, Product> updateProduct(Product product);
    Either<Failure, bool> deleteProduct(String id);
}
