import 'package:r34_12/core/error/failures.dart';
import 'package:r34_12/features/products/domain/entities/product.dart';
import 'package:r34_12/features/products/domain/repositories/product_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class UpdateProduct {
  final ProductRepository repository;

  UpdateProduct(this.repository);

  Either<Failure, Product> call(UpdateProductParams params) {
    return repository.updateProduct(params.product);
  }
}

class UpdateProductParams extends Equatable {
  final Product product;

  const UpdateProductParams({required this.product});

  @override
  List<Object> get props => [product];
}