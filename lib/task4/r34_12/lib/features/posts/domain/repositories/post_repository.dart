import 'package:r34_12/core/error/failures.dart';
import 'package:r34_12/features/posts/domain/entities/post.dart';
import 'package:dartz/dartz.dart';

abstract class PostRepository {
  Future<Either<Failure, List<Post>>> getAllPosts();
  Future<Either<Failure, Post>> getPost(String id);
  Future<Either<Failure, Post>> createPost(Post post);
  Future<Either<Failure, Post>> updatePost(Post post);
  Future<Either<Failure, bool>> deletePost(String id);
}