import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_02/core/error/failures.dart';
import 'package:r34_02/features/products/domain/entities/product.dart';
import 'package:r34_02/features/products/domain/repositories/product_repository.dart';

class CreateProduct {
  final ProductRepository productRepository;
  CreateProduct(this.productRepository);

  Future<Either<Failure, Product>> call(CreateProductParam createProductParam) {
    return productRepository.createProduct(createProductParam.product);
  }
}

class CreateProductParam extends Equatable {
  final Product product;
  const CreateProductParam({required this.product});

  @override
  List<Object?> get props => [product];
}
