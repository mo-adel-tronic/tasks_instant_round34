import 'package:dartz/dartz.dart';
import 'package:task4/core/error/failures.dart';
import 'package:task4/features/products/domain/entities/product.dart';
import 'package:task4/features/products/domain/repositories/product_repository.dart';

class GetAllProducts {
  final ProductRepository repository;

  GetAllProducts(this.repository);

  Future<Either<Failure, List<Product>>> call() async{
    return await repository.getAllProducts();
  }
}
