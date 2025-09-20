import 'package:dartz/dartz.dart';
import 'package:r34_30/core/error/failures.dart';
import 'package:r34_30/features/product/domin/entities/product.dart';
import 'package:r34_30/features/product/domin/repositories/product_repository.dart';

class GetAllProducts {
  final ProductRepository repository;

  GetAllProducts(this.repository);

  Future<Either<Failure, List<Product>>> call() async {
    return repository.getAllProducts();
  }
}
