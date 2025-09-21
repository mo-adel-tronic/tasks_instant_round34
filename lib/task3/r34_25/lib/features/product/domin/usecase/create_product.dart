import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:task3/core/error/failures.dart';
import 'package:task3/features/product/domin/entities/product.dart';
import 'package:task3/features/product/domin/repositories/product_repository.dart';

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
