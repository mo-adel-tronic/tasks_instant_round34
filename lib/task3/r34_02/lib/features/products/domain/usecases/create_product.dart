// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_02/core/error/failures.dart';
import 'package:r34_02/features/products/domain/entities/product.dart';
import 'package:r34_02/features/products/domain/repositories/product_repository.dart';

class CreateProduct {
  final ProductRepository prductRepository;
  CreateProduct(this.prductRepository);
  Either<Failure, Product> call(CreateProductParam createProductParam) {
    return prductRepository.createProduct(createProductParam.product);
  }
}

//create class for parameters that will sent to create product(to edit in it in any time) (some type of isolation)

class CreateProductParam extends Equatable {
  final Product product;
  const CreateProductParam({required this.product});

  @override
  List<Object?> get props => [product];
}
