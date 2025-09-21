import 'package:r34_24/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import '../entites/post.dart';

abstract class PostRepository {
  Either<Failure, List<Post>> getAllPosts();
  Either<Failure, Post> getPost(String id);
  Either<Failure, Post> createPost(Post post);
  Either<Failure, Post> updatePost(Post post);
  Either<Failure, bool> deletePost(String id);
}