import 'package:equatable/equatable.dart';
import 'package:task7/core/error/failures.dart';
import 'package:task7/features/products/domain/entities/product.dart';
import 'package:dartz/dartz.dart';
import 'package:task7/features/products/domain/repositories/product_repository.dart';

class CreateProduct {
  final ProductRepository repository;
  CreateProduct(this.repository);
  Future<Either<Failure, Product>> call(createProductparams params) {
    return repository.createProduct(params.product);
  }
}

class createProductparams extends Equatable {
  final Product product;
  const createProductparams({required this.product});
  @override
  List<Object?> get props => [product];
}
