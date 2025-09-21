import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_12/core/error/failures.dart';
import 'package:r34_12/features/products/data/models/product_model.dart';
import 'package:r34_12/features/products/domain/repositories/product_repository.dart';

class UpdateProduct {
  final ProductRepository repository;

  UpdateProduct(this.repository);

  Future<Either<Failure, ProductModel>> call(UpdateProductParams params) {
    return repository.updateProduct(params.product);
  }
}

class UpdateProductParams extends Equatable {
  final ProductModel product;

  const UpdateProductParams({required this.product});

  @override
  List<Object?> get props => [product];
}
