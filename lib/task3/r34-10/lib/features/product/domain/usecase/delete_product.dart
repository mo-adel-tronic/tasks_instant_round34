import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_10/core/error/failures.dart';
import 'package:r34_10/features/product/domain/repositories/product_repository.dart';


class DeleteProduct {
  final ProductRepository repository;

  DeleteProduct(this.repository);

  Either<Failure, bool> call(DeleteProductParams params) {
    return repository.deleteProduct(params.id);
  }
}

class  DeleteProductParams extends Equatable {
  final String id;

  const DeleteProductParams({required this.id});

  @override
  List<Object?> get props => [id];
}