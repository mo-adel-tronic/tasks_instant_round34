import 'package:dartz/dartz.dart';
import 'package:r34_02/core/error/failures.dart';
import '../entities/product.dart';

abstract class ProductRepository {
  Either<Failure, List<Product>> getAllProducts();
  //why Either from dartz library?  getAllProduct will return List of product or failur

  Either<Failure, Product> getProduct(String id);
  Either<Failure, Product> createProduct(Product product);
  Either<Failure, Product> updateProduct(Product product);
  Either<Failure, bool> deleteProduct(String id);
}

//implement them in data layer

//implement class use case for every method to use it only in presentation layer
//Create use case for  getProduct , use case for createProduct , ...
