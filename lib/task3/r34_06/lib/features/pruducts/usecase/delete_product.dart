// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_02/core/error/failures.dart';
import 'package:r34_02/features/products/domain/repositories/product_repository.dart';

class DeleteProduct {
  final ProductRepository prductRepository;
  DeleteProduct(this.prductRepository);
  Either<Failure, bool> call(DeleteProductParam deleteProductParam) {
    return prductRepository.deleteProduct(deleteProductParam.id);
  }
}

//create class for parameters that will sent to delete product(to edit in it in any time) (some type of isolation)

class DeleteProductParam extends Equatable {
  final String id;
  const DeleteProductParam({required this.id});

  @override
  List<Object?> get props => [id];
}
