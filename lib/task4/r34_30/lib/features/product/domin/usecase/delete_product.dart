import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_30/core/error/failures.dart';
import 'package:r34_30/features/product/domin/repositories/product_repository.dart';

class DeleteProduct {
  final ProductRepository repository;

  DeleteProduct(this.repository);

  Future<Either<Failure, bool>> call(DeleteProductParams params) {
    return repository.deleteProduct(params.id);
  }
}

class DeleteProductParams extends Equatable {
  final String id;

  const DeleteProductParams({required this.id});

  @override
  List<Object?> get props => [id];
}
