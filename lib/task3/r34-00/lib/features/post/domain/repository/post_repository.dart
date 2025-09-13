import 'package:dart_either/dart_either.dart';
import 'package:r34_00/core/errors/failures.dart';
import 'package:r34_00/features/post/domain/entity/post.dart';

abstract class PostRepository {
  Either<Failure , List<Post>> getAllPosts();
  Either<Failure ,Post> getPost({required int id ,required  int userId});
  Either<Failure ,void> addPost({required Post post});
  Either<Failure ,Post> updatePost({required Post post});
  Either<Failure ,void> deletePost({required int id});

}