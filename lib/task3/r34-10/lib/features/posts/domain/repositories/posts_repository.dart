import 'package:dartz/dartz.dart';
import 'package:r34_10/core/error/failures.dart';
import 'package:r34_10/features/posts/domain/entites/posts.dart';
abstract class PostRepository {
  Either<Failure, List<Post>> getAllPosts();
  Either<Failure, Post> getPost(String id);
  Either<Failure, Post> updatePost(Post post);
  Either<Failure, Post> createPost(Post post);
  Either<Failure, bool> deletePost(String id);
}