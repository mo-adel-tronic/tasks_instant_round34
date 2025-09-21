import 'package:dartz/dartz.dart';
import 'package:r34_02/core/error/failures.dart';
import 'package:r34_02/features/products/domain/entities/product.dart';
import 'package:r34_02/features/products/domain/repositories/product_repository.dart';

class GetAllProduct {
  final ProductRepository prductRepository;

  GetAllProduct(this.prductRepository);

  //Call Method
  /*Should Called Call to use it in presentation like:
  GetAllProduct gp = GetAllProduct(repository);
  gp(); instead of gp.call()
  
   */
  Either<Failure, List<Product>> call() {
    return prductRepository.getAllProducts();
  }
}
