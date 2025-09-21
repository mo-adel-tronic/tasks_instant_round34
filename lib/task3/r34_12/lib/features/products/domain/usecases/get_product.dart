import 'package:r34_12/core/error/failures.dart';
import 'package:r34_12/features/products/domain/entities/product.dart';
import 'package:r34_12/features/products/domain/repositories/product_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetProduct {
  final ProductRepository repository;

  GetProduct(this.repository);

  Either<Failure, Product> call(GetProductParams params) {
    return repository.getProduct(params.id);
  }
}

class GetProductParams extends Equatable {
  final String id;

  const GetProductParams({required this.id});

  @override
  List<Object> get props => [id];
}