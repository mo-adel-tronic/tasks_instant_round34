import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_08/core/error/failures.dart';
import 'package:r34_08/feature/products/domain/entities/product.dart';
import 'package:r34_08/feature/products/domain/repositories/product_repository.dart';

class GetProduct {
  final ProductRepository repository;

  GetProduct(this.repository);

  Either<Failures, Product> call(GetProductPrameter prameter) {
    return repository.getProduct(prameter.id);
  }
}

class GetProductPrameter extends Equatable{
  final String id;

  const GetProductPrameter({required this.id});
  
  @override
  
  List<Object?> get props => [id];
}
