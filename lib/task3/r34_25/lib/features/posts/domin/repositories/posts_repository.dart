import 'package:dartz/dartz.dart';
import 'package:task3/core/error/failures.dart';
import 'package:task3/features/posts/domin/entities/posts.dart';

abstract class PostRepository {
  Either<Failure, List<Post>> getAllPosts();
  Either<Failure, Post> getPost(String id);
  Either<Failure, Post> updatePost(Post post);
  Either<Failure, Post> createPost(Post post);
  Either<Failure, bool> deletePost(String id);
}