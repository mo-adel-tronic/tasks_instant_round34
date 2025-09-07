import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_08/core/error/failures.dart';
import 'package:r34_08/feature/products/domain/entities/product.dart';
import 'package:r34_08/feature/products/domain/repositories/product_repository.dart';

class CreateProduct {
  final ProductRepository repository;

  CreateProduct(this.repository);

  Either<Failures, Product> call(CreateProductPrameter prameter) {
    return repository.createProducts(prameter.product);
  }
}

class CreateProductPrameter extends Equatable{
  final Product product;
  const CreateProductPrameter({required this.product});
  
  @override
  
  List<Object?> get props => [product];
}
