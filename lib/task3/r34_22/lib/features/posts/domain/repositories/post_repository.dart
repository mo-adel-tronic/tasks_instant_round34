import 'package:dartz/dartz.dart';
import 'package:r34_22/core/error/failures.dart';
import 'package:r34_22/features/posts/domain/entites/post.dart';
import 'package:r34_22/features/products/domain/entities/product.dart';

abstract class PostRepository {
  Either<Failure, List<Product>> getAllPosts();
  Either<Failure, Product> getpost(String id);
  Either<Failure, Product> createPost(Post post);
  Either<Failure, Product> updatepost( Post post);
  Either<Failure, Product> deletepost(String id);
}
