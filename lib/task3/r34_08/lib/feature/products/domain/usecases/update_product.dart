import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_08/core/error/failures.dart';
import 'package:r34_08/feature/products/domain/entities/product.dart';
import 'package:r34_08/feature/products/domain/repositories/product_repository.dart';

class UpdateProduct {
  final ProductRepository repository;

  UpdateProduct(this.repository);

  Either<Failures, Product> call(UpdateProductPrameter prameter) {
    return repository.updateProducts(prameter.product);
  }
}

class UpdateProductPrameter extends Equatable {
  final Product product;

  const UpdateProductPrameter({required this.product});

  @override
  List<Object?> get props => [product];
}
