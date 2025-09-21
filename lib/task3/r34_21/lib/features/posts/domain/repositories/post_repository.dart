import 'package:dartz/dartz.dart';
import 'package:r34_12/core/error/faliures.dart';
import 'package:r34_12/features/posts/domain/entities/post.dart';

abstract class PostRepository {
  Either<Failure, Post> createpost(Post post);
  Either<Failure, Post> updatepost(Post post);
  Either<Failure, bool> deletepost(String id);

} 