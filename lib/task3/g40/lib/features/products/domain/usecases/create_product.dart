import 'package:dart_crud_app/core/error/failures.dart';
import 'package:dart_crud_app/features/products/domain/entities/product.dart';
import 'package:dart_crud_app/features/products/domain/repositories/product_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

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
