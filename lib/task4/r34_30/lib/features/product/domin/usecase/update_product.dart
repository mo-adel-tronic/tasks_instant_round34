import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_30/core/error/failures.dart';
import 'package:r34_30/features/product/domin/entities/product.dart';
import 'package:r34_30/features/product/domin/repositories/product_repository.dart';

class UpdateProduct {
  final ProductRepository repository;

  UpdateProduct(this.repository);

  Future<Either<Failure, Product>> call(UpdateProductParams params) {
    return repository.updateProduct(params.product);
  }
}

class UpdateProductParams extends Equatable {
  final Product product;

  const UpdateProductParams({required this.product});

  @override
  List<Object?> get props => [product];
}
