import 'package:dartz/dartz.dart';
 import 'package:task7/features/posts/domain/entities/post.dart';
import 'package:task7/core/error/failures.dart';

abstract class PostRepository {
  Future<Either<Failure, List<Post>>> getAllPost();
  Future<Either<Failure, Post>> getPost(String id);
  Future<Either<Failure, Post>> createPost(Post post);
  Future<Either<Failure, Post>> updatePost(String id, Post post);
  Future<Either<Failure, Post>> deletePost(String id);

}