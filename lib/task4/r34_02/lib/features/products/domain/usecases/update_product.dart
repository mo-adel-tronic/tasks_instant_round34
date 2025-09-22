import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_02/core/error/failures.dart';
import 'package:r34_02/features/products/domain/entities/product.dart';
import 'package:r34_02/features/products/domain/repositories/product_repository.dart';

class UpdateProduct {
  final ProductRepository productRepository;
  UpdateProduct(this.productRepository);

  Future<Either<Failure, Product>> call(UpdateProductParam params) {
    return productRepository.updateProduct(params.product);
  }
}

class UpdateProductParam extends Equatable {
  final Product product;
  const UpdateProductParam({required this.product});

  @override
  List<Object?> get props => [product];
}
