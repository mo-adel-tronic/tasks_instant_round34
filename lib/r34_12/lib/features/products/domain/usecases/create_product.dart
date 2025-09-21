import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_12/core/error/failures.dart';
import 'package:r34_12/features/products/data/models/product_model.dart';
import 'package:r34_12/features/products/domain/repositories/product_repository.dart';

class CreateProduct {
  final ProductRepository repository;

  CreateProduct(this.repository);

  Future<Either<Failure, ProductModel>> call(CreateProductParams params) {
    return repository.createProduct(params.product);
  }
}

class CreateProductParams extends Equatable {
  final ProductModel product;

  const CreateProductParams({required this.product});

  @override
  List<Object?> get props => [product];
}
