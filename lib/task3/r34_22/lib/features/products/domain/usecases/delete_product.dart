import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_22/core/error/failures.dart';
import 'package:r34_22/features/products/domain/entities/product.dart';
import 'package:r34_22/features/products/domain/repositories/product_repository.dart';

class DeleteProduct {
  final ProductRepository repository;
  DeleteProduct(this.repository);
    Either<Failure, Product> call(DeleteProductparams params) {
    return repository.deleteProduct(params.id);
  }

}


class DeleteProductparams extends Equatable {
  final String id;
  const DeleteProductparams({required this.id});
  @override
  List<Object?> get props => [id];
}