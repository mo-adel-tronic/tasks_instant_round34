import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:task3/core/error/failures.dart';
import 'package:task3/features/product/domin/repositories/product_repository.dart';

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
