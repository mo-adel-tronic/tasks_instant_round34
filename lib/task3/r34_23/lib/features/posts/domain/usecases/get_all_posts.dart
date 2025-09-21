import 'package:dartz/dartz.dart';
import 'package:r34_23/core/error/failures.dart';
import 'package:r34_23/features/posts/domain/entities/post.dart';
import 'package:r34_23/features/posts/domain/repositories/post_repository.dart';

class GetAllPosts {
  final PostRepository repository;
  GetAllPosts(this.repository);

  Either<Failure, List<Post>> call() {
    return repository.getAllPosts();
  }
}