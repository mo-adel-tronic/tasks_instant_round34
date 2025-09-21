import '../entity/post_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:r34_01/core/error/failures.dart';

abstract class PostRepository {
  Either<Failure, List<Post>> getAllPosts();
  Either<Failure, Post> getPost(String id);
  Either<Failure, Post> createPost(Post post);
  Either<Failure, Post> updatePost(Post post);
  Either<Failure, bool> deletePost(String id);
}
