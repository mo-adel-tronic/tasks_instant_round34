import 'package:equatable/equatable.dart';
import 'package:task7/core/error/failures.dart';
import 'package:task7/features/products/domain/entities/product.dart';
import 'package:dartz/dartz.dart';
import 'package:task7/features/products/domain/repositories/product_repository.dart';
class GetProduct {
  final ProductRepository repository;
  GetProduct(this.repository);
  Future<Either<Failure, Product>> call(getProductparams params) {
    return repository.getProduct(params.id);
  }
 
}


class getProductparams extends Equatable {
  final String id;
  const getProductparams({required this.id});
  @override
  List<Object?> get props => [id];
}