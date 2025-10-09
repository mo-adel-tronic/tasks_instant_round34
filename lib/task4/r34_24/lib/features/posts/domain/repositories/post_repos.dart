import 'package:r34_24/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import '../entites/post.dart';

abstract class PostRepository {
  Future<Either<Failure, List<Post>>> getAllPosts();
  Future<Either<Failure, Post>> getPost(String id);
  Future<Either<Failure, Post>> createPost(Post post);
  Future<Either<Failure, Post>> updatePost(Post post);
  Future<Either<Failure, bool>> deletePost(String id);
}
