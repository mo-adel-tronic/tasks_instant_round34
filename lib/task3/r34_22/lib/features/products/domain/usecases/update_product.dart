import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_22/core/error/failures.dart';
import 'package:r34_22/features/products/domain/entities/product.dart';
import 'package:r34_22/features/products/domain/repositories/product_repository.dart';

class UpdateProduct {
  final ProductRepository repository;
  UpdateProduct(this.repository);
  Either<Failure, Product> call(UpdateProductparams params) {
    return repository.updateProducts(params.id, params.product);
  }
}

class UpdateProductparams extends Equatable {
  final String id;
  final Product product;

  const UpdateProductparams({required this.id, required this.product});
  @override
  List<Object?> get props => [id, product];
}