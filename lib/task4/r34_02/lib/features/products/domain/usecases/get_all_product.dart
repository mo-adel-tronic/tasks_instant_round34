import 'package:dartz/dartz.dart';
import 'package:r34_02/core/error/failures.dart';
import 'package:r34_02/features/products/domain/entities/product.dart';
import 'package:r34_02/features/products/domain/repositories/product_repository.dart';

class GetAllProduct {
  final ProductRepository productRepository;
  GetAllProduct(this.productRepository);

  Future<Either<Failure, List<Product>>> call() {
    return productRepository.getAllProducts();
  }
}
