import 'package:dartz/dartz.dart';
import 'package:r34_30/core/error/failures.dart';
import 'package:r34_30/features/posts/domin/entities/posts.dart';
import 'package:r34_30/features/posts/domin/repositories/posts_repository.dart';

class GetAllPosts {
  final PostRepository repository;

  GetAllPosts(this.repository);

  Future<Either<Failure, List<Post>>> call() {
    return repository.getAllPosts();
  }
}
