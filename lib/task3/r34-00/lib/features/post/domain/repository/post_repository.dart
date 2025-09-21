import 'package:dart_either/dart_either.dart';
import 'package:r34_00/core/errors/failures.dart';
import 'package:r34_00/features/post/domain/entity/post.dart';

abstract class PostRepository {
  Either<Failure,List<Post>> getAllPosts();
  Either<Failure,Post> getPost(int id , int userId);
  Either<Failure,void> addPost(Post post);
  Either<Failure,void> deletePost(int id);
  Either<Failure,void> updatePost(Post post);


}


