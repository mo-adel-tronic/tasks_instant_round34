import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:r34_02/core/error/failures.dart';
import 'package:r34_02/features/products/domain/entities/product.dart';
import 'package:r34_02/features/products/domain/repositories/product_repository.dart';

class GetProduct {
  final ProductRepository prductRepository;
  GetProduct(this.prductRepository);
  Either<Failure, Product> call(GetProductParam getProductParam) {
    return prductRepository.getProduct(getProductParam.id);
  }
}

//create class for parameters that will sent to get product(to edit in it in any time) (some type of isolation)

class GetProductParam extends Equatable {
  final String id;
  const GetProductParam({required this.id});

  @override
  List<Object?> get props => [id];
}
