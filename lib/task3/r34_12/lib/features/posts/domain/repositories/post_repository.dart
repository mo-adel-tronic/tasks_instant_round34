import 'package:r34_12/core/error/failures.dart';
import 'package:r34_12/features/posts/domain/entities/post.dart';
import 'package:dartz/dartz.dart';

abstract class PostRepository {
  Either<Failure, List<Post>> getAllPosts();
  Either<Failure, Post> getPost(String id);
  Either<Failure, Post> createPost(Post post);
  Either<Failure, Post> updatePost(Post post);
  Either<Failure, bool> deletePost(String id);
}