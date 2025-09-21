import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_12/core/error/failures.dart';
import 'package:r34_12/features/products/data/models/product_model.dart';
import 'package:r34_12/features/products/domain/repositories/product_repository.dart';

class GetProduct {
  final ProductRepository repository;

  GetProduct(this.repository);

  Future<Either<Failure, ProductModel>> call(GetProductParams params) {
    return repository.getProduct(params.id);
  }
}

class GetProductParams extends Equatable {
  final String id;

  const GetProductParams({required this.id});

  @override
  List<Object?> get props => [id];
}
