import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';


import 'package:r34_21/core/error/failures.dart';
import 'package:r34_21/features/product/domain/entities/product.dart';
import 'package:r34_21/features/product/domain/repositories/repository_product.dart';

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
  List<Object?> get props => [product];
}