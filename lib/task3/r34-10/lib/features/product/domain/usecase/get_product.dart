import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_10/core/error/failures.dart';
import 'package:r34_10/features/product/domain/entites/product.dart';
import 'package:r34_10/features/product/domain/repositories/product_repository.dart';
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
  List<Object?> get props => [id];  
}