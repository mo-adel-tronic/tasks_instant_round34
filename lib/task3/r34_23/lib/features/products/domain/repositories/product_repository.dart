import 'package:dartz/dartz.dart';
import 'package:r34_23/core/error/failures.dart';
import 'package:r34_23/features/products/domain/entities/product.dart';

abstract class ProductRepository {
  Either<Failure, List <Product>> getallproduct();
  Either<Failure, Product> getproduct(String id);
  Either<Failure,Product> createproduct(Product product);
  Either<Failure,Product> updateproduct(Product product);
  Either<Failure,bool> deleteproduct(String id);


}