import 'package:dartz/dartz.dart';
import 'package:r34_01/core/error/failures.dart';
import '../entity/book_entity.dart';
import '../repository/book_repository.dart';


class GetAllProducts {
  final ProductRepository repository;

  GetAllProducts(this.repository);

  Future<Either<Failure, List<Product>>> call() async {
    return repository.getAllProducts();
  }
}