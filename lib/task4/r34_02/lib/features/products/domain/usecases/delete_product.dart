import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_02/core/error/failures.dart';
import 'package:r34_02/features/products/domain/repositories/product_repository.dart';

class DeleteProduct {
  final ProductRepository productRepository;
  DeleteProduct(this.productRepository);

  Future<Either<Failure, bool>> call(DeleteProductParam params) {
    return productRepository.deleteProduct(params.id);
  }
}

class DeleteProductParam extends Equatable {
  final String id;
  const DeleteProductParam({required this.id});

  @override
  List<Object?> get props => [id];
}
