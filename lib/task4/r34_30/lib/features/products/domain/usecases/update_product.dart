import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:task4/core/error/failures.dart';
import 'package:task4/features/products/domain/entities/product.dart';
import 'package:task4/features/products/domain/repositories/product_repository.dart';

class UpdateProduct {
  final ProductRepository repository;

  UpdateProduct(this.repository);

  Future<Either<Failure, Product>> call(UpdateProductParams params) async{
    return await repository.updateProduct(params.product);
  }
}

class UpdateProductParams extends Equatable {
  final Product product;

  const UpdateProductParams({required this.product});

  @override
  List<Object> get props => [product];
}