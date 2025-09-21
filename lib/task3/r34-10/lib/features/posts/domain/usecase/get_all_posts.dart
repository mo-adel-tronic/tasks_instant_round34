import 'package:dartz/dartz.dart';
import 'package:r34_10/core/error/failures.dart';
import 'package:r34_10/features/posts/domain/entites/posts.dart';
import 'package:r34_10/features/posts/domain/repositories/posts_repository.dart';
class GetAllPosts {
  final PostRepository repository;

  GetAllPosts(this.repository);

  Either<Failure, List<Post>> call() {
    return repository.getAllPosts();
  }
}