import 'package:dart_crud_app/core/error/failures.dart';
import 'package:dart_crud_app/features/products/domain/entities/product.dart';
import 'package:dart_crud_app/features/products/domain/repositories/product_repository.dart';
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
  List<Object?> get props => [id];
}
