import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:task4/core/error/failures.dart';
import 'package:task4/features/products/domain/entities/product.dart';
import 'package:task4/features/products/domain/repositories/product_repository.dart';

class GetProduct {
  final ProductRepository repository;

  GetProduct(this.repository);

  Future<Either<Failure, Product>> call(GetProductParams params) async{
    return await repository.getProduct(params.id);
  }
}

class GetProductParams extends Equatable {
  final String id;

  const GetProductParams({required this.id});

  @override
  List<Object> get props => [id];
}