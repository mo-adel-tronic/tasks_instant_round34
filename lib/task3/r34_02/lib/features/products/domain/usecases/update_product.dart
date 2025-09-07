// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_02/core/error/failures.dart';
import 'package:r34_02/features/products/domain/entities/product.dart';
import 'package:r34_02/features/products/domain/repositories/product_repository.dart';

class UpdateProduct {
  final ProductRepository prductRepository;
  UpdateProduct(this.prductRepository);
  Either<Failure, Product> call(UpdateProductParam updateProductParam) {
    return prductRepository.updateProduct(updateProductParam.product);
  }
}

//create class for parameters that will sent to update product(to edit in it in any time) (some type of isolation)

class UpdateProductParam extends Equatable {
  final Product product;
  const UpdateProductParam({required this.product});

  @override
  List<Object?> get props => [product];
}
