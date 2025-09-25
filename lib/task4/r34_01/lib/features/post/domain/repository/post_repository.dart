import '../entity/post_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:r34_01/core/error/failures.dart';

abstract class PostRepository {
  Future<Either<Failure, List<Post>>> getAllPosts();
  Future<Either<Failure, Post>> getPost(String id);
  Future<Either<Failure, Post>> createPost(Post post);
  Future<Either<Failure, Post>> updatePost(Post post);
  Future<Either<Failure, bool>> deletePost(String id);
}
