import 'package:dartz/dartz.dart';
import 'package:r34_22/core/error/failures.dart';
import 'package:r34_22/features/posts/domain/repositories/post_repository.dart';
import 'package:r34_22/features/products/domain/entities/product.dart';


class GetAllPosts {
  final PostRepository repository;

  GetAllPosts(this.repository);

  Either<Failure, List<Product>> call() {
    return repository.getAllPosts();
  }
}