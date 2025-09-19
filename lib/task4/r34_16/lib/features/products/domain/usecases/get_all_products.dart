import 'package:r34_16/core/error/failures.dart';
import 'package:r34_16/features/products/domain/entities/product.dart';
import 'package:r34_16/features/products/domain/repositories/product_repository.dart';
import 'package:dartz/dartz.dart';

class GetAllProducts {
  final ProductRepository repository;

  GetAllProducts(this.repository);

  Future<Either<Failure, List<Product>>> call() async{
    return await repository.getAllProducts();
  }
}