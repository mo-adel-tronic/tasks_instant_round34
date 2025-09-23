import 'package:dartz/dartz.dart';
import 'package:task3/core/error/failures.dart';
import 'package:task3/features/posts/domin/entities/posts.dart';
import 'package:task3/features/posts/domin/repositories/posts_repository.dart';

class GetAllPosts {
  final PostRepository repository;

  GetAllPosts(this.repository);

  Either<Failure, List<Post>> call() {
    return repository.getAllPosts();
  }
}
