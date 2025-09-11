import 'package:equatable/equatable.dart';
import 'package:task7/core/error/failures.dart';
import 'package:task7/features/products/domain/entities/product.dart';
import 'package:dartz/dartz.dart';
import 'package:task7/features/products/domain/repositories/product_repository.dart';
class DeleteProduct {
  final ProductRepository repository;
  DeleteProduct(this.repository);
    Future<Either<Failure, Product>> call(DeleteProductparams params) {
    return repository.deleteProduct(params.id);
  }
 
}


class DeleteProductparams extends Equatable {
  final String id;
  const DeleteProductparams({required this.id});
  @override
  List<Object?> get props => [id];
}
