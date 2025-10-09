import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_02/core/error/failures.dart';
import 'package:r34_02/features/products/domain/entities/product.dart';
import 'package:r34_02/features/products/domain/repositories/product_repository.dart';

class GetProduct {
  final ProductRepository productRepository;
  GetProduct(this.productRepository);

  Future<Either<Failure, Product>> call(GetProductParam params) {
    return productRepository.getProduct(params.id);
  }
}

class GetProductParam extends Equatable {
  final String id;
  const GetProductParam({required this.id});

  @override
  List<Object?> get props => [id];
}
