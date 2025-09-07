import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_12/core/error/faliures.dart';
import 'package:r34_12/features/products/domain/entities/product.dart';
import 'package:r34_12/features/products/domain/repositories/product_repositories.dart';


class CreateProduct {
  final ProductRepository repository;

  CreateProduct(this.repository);

  Either<Failure, Product> call(CreateProductParams params) {
    return repository.createProduct(params.product);
  }
}

class CreateProductParams extends Equatable {
  final Product product;

  const CreateProductParams({required this.product});

  @override
  List<Object?> get props => [product];
}