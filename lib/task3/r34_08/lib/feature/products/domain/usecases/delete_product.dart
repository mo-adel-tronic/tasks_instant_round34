import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_08/core/error/failures.dart';
import 'package:r34_08/feature/products/domain/repositories/product_repository.dart';

class DeleteProduct {
  final ProductRepository repository;

  DeleteProduct(this.repository);

  Either<Failures, bool> call(DeleteProductPrameter prameter) {
    return repository.deleteProducts(prameter.id);
  }
}

class DeleteProductPrameter extends Equatable {
  final String id;

  DeleteProductPrameter({required this.id});

  @override
  List<Object?> get props => [id];
}
